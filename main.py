import json
import sys
import os
from shutil import copyfile
from datetime import datetime
from rules import Rules
from validators import Validators

# Global list for log entries
log_entries = []

# Global datetime format string for all timestamps
DATETIME_FORMAT = '%m-%d-%Y %H:%M:%S'  # Format: MM-DD-YYYY HH:MM:SS

    
def is_comment(line):
    # Check if a line is a comment
    stripped_line = line.strip()

    # Single-line comment starts with '--'
    if stripped_line.startswith('--'):
        return True
    # Block comment (starting)
    if stripped_line.startswith('/*') and stripped_line.endswith('*/'):
        return True
    return False

def log_message(message):
    # Append a timestamped message to the global log entries.
    timestamped_message = f"{datetime.now().strftime(DATETIME_FORMAT)} - {message}"
    log_entries.append(f"-- {timestamped_message}")



def create_processed_copy(tsql_file_path):

    # Creates a timestamped copy of the original T-SQL file with line numbers.
    # This function also ensures that all lines, including comments and empty lines, are numbered.

    # Args:
    #     tsql_file_path (str): The path to the original T-SQL file.

    # Returns:
    #     tuple: A tuple containing the new file name and the list of lines from the file.
    
    # Split the file path into file name and extension
    file_name, file_ext = os.path.splitext(tsql_file_path)
    
    # Generate a timestamp (MMDDYYYYHHMMSS) to ensure the new file name is unique
    timestamp_for_filename = datetime.now().strftime("%m%d%Y%H%M%S")
    
    # Create the new file name with the original name, appended with "_processed_<timestamp>"
    new_file_name = f"{file_name}_processed_{timestamp_for_filename}{file_ext}"
    
    # Copy the original file to the new file (this ensures we have an exact duplicate to start with)
    copyfile(tsql_file_path, new_file_name)
    
    # Read all lines from the copied file for further processing
    with open(new_file_name, 'r') as file:
        lines = file.readlines()  # Read lines into a list, preserving order

    # Open the copied file in write mode to overwrite with numbered lines
    with open(new_file_name, 'w') as file:
        # Enumerate through the lines, starting the line number count from 1
        for line_number, line in enumerate(lines, start=1):
            # Write each line back to the file with a line number prefix (even for comments or empty lines)
            file.write(f"{line_number}  {line}")

    # Log a message indicating the file was processed and line numbers were added
    log_message(f"File copied and updated with line numbers (including all lines): {new_file_name}")

    # Return the new file name and the list of lines for further validation and processing
    return new_file_name, lines


def write_processing_log(new_file_name):
    # Print each log entry to the console
    for entry in log_entries:
        print(entry)

    # Write the processing log to the end of the copied file
    with open(new_file_name, 'a') as file:  # Open in append mode
        file.write("\n-- Processing Log --\n")
        for entry in log_entries:
            file.write(f"{entry}\n")


# # OLD
# def process_validation_rules(lines, validators):
#     # Log message for the start of the validation process
#     log_message("Starting validation process...")

#     in_create_table_block = False  # Track if we're inside a CREATE TABLE block

#     for i, line in enumerate(lines, 1):
#         # Convert the line to lowercase for case-insensitive checking
#         lower_line = line.lower()

#         # Only process lines that contain "create table"
#         if "create table" in lower_line:
#             in_create_table_block = True

#             # Validate the table name regardless of capitalization
#             if validators.is_valid_create_table_statement_v2(line):
#                 log_message(f"Line {i}: Passed - Table Name Convention for '{line.strip()}'")
#             else:
#                 log_message(f"Line {i}: Failed - Table Name Convention for '{line.strip()}'")

#         # Process the columns if we're inside a CREATE TABLE block
#         elif in_create_table_block:
#             stripped_line = line.strip()

#             # If the line starts with '[', it's a column definition
#             if stripped_line.startswith('['):
#                 # Validate the column name using the column name validation function
#                 if validators.is_valid_column_name_statement(line):
#                     log_message(f"Line {i}: Passed - Column Name Convention for '{line.strip()}'")
#                 else:
#                     log_message(f"Line {i}: Failed - Column Name Convention for '{line.strip()}'")
#             else:
#                 # End of CREATE TABLE block once we encounter a line that doesn't start with '['
#                 in_create_table_block = False

#                 # Log end of table processing
#                 log_message(f"Line {i}: End of table definition block.")

#         # Only process lines that contain "create database"
#         if "create database" in lower_line:
#             # Validate the database name using the appropriate validator
#             if validators.is_valid_create_database_statement(line):
#                 log_message(f"Line {i}: Passed - Database Name Convention for '{line.strip()}'")
#             else:
#                 log_message(f"Line {i}: Failed - Database Name Convention for '{line.strip()}'")
    
#     # Log message for the end of the validation process
#     log_message("Ending validation process...")

def process_validation_rules(lines, validators):
    
    # Log message for the start of the validation process
    log_message("Starting validation process...")

    in_create_table_block = False  # Track if we're inside a CREATE TABLE block

    for i, line in enumerate(lines, 1):
        # Trim leading/trailing whitespace
        stripped_line = line.strip()

        # Skip lines that are comments (start with '/*' or '--')
        if stripped_line.startswith('/*') or stripped_line.startswith('--'):
            continue

        # Convert the line to lowercase for case-insensitive checking
        lower_line = line.lower()

        # Only process lines that contain "create table"
        if "create table" in lower_line:
            in_create_table_block = True

            # Validate the table name regardless of capitalization
            if validators.is_valid_create_table_statement_v2(line):
                log_message(f"Line {i}: Passed - Table Name Convention for '{line.strip()}'")
            else:
                log_message(f"Line {i}: Failed - Table Name Convention for '{line.strip()}'")

        # Process the columns if we're inside a CREATE TABLE block
        elif in_create_table_block:
            # If the line starts with '[', it's a column definition
            if stripped_line.startswith('['):
                # Validate the column name using the column name validation function
                if validators.is_valid_column_name_statement(line):
                    log_message(f"Line {i}: Passed - Column Name Convention for '{line.strip()}'")
                else:
                    log_message(f"Line {i}: Failed - Column Name Convention for '{line.strip()}'")
            else:
                # End of CREATE TABLE block once we encounter a line that doesn't start with '['
                in_create_table_block = False
                log_message(f"Line {i}: End of table definition block.")

        # Only process lines that contain "create database"
        if "create database" in lower_line:
            # Validate the database name using the appropriate validator
            if validators.is_valid_create_database_statement(line):
                log_message(f"Line {i}: Passed - Database Name Convention for '{line.strip()}'")
            else:
                log_message(f"Line {i}: Failed - Database Name Convention for '{line.strip()}'")

        # Process lines that contain "view" or "create view"
        if "view" in lower_line:
            # Check if it's a "CREATE VIEW" or simply "VIEW" definition
            if validators.is_valid_view_name_statement(line):
                log_message(f"Line {i}: Passed - View Name Convention for '{line.strip()}'")
            else:
                log_message(f"Line {i}: Failed - View Name Convention for '{line.strip()}'")

    # Log message for the end of the validation process
    log_message("Ending validation process...")



def main():

    # Ask the user for the path to the T-SQL file
    tsql_file_path = input("Enter the full path of the T-SQL file to process: ")

    # Ask the user for the rules file (default to 'rules.json' if no input)
    rules_file = input("Enter the full path of the rules JSON file (default: rules.json): ") or 'rules.json'
  
    try:

         # Load rules using the Rules class
        rules_obj = Rules(rules_file)  # Automatically loads and validates the rules JSON

        # Initialize the Validators class with the loaded rules

        validators = Validators(in_rules_obj = rules_obj)

        # Create a timestamped copy of the T-SQL file and add line numbers, validating lines
        new_file_name, lines = create_processed_copy(tsql_file_path)

        
        # work on validation rules
        process_validation_rules(lines, validators)


        # Write processing log to both console and file
        write_processing_log(new_file_name)

    except FileNotFoundError as e:
        log_message(f"Error: {e}")
        write_processing_log(new_file_name)  # Write log even if there's an error

    except json.JSONDecodeError:
        log_message(f"Error: Invalid JSON file at {rules_file}")
        write_processing_log(new_file_name)  # Write log even if there's an error



if __name__ == "__main__":
    main()
