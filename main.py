
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

# # OLD REMOVE IT
# def load_rules_from_json(file_path):
#     # Load and parse rules from a JSON file.
#     if not os.path.exists(file_path):
#         print(f"Error: File '{file_path}' does not exist.")
#         return None
    
#     try:
#         with open(file_path, 'r') as file:
#             rules = json.load(file)
#             return rules
#     except json.JSONDecodeError as e:
#         print(f"Error: Failed to parse JSON file. {e}")
#         return None
    
# TODO - this is defined in Rules class and  should be used 
# REMOVE - duplicate code
def load_rules_from_json(file_path):

    # """
    # Loads and parses rules from a JSON file.
    
    # Args:
    #     file_path (str): The path to the JSON file containing rules.
    
    # Returns:
    #     dict: A dictionary containing rules if the file is successfully loaded and parsed.
    #           Returns None if the file doesn't exist or there are parsing errors.
    # """


    # Check if the file exists before attempting to open it
    if not os.path.exists(file_path):
        # Print an error message if the file does not exist
        print(f"Error: File '{file_path}' does not exist.")
        return None
    
    try:
        # Open the JSON file in read mode
        with open(file_path, 'r') as file:
            # Load the contents of the file into a Python dictionary
            rules = json.load(file)
            return rules  # Return the dictionary with the rules
            
    except json.JSONDecodeError as e:
        # Catch and print a detailed error if the JSON file has parsing issues
        print(f"Error: Failed to parse JSON file. {e}")
        return None

    
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

def processing_database_name(lines, validators):
    results = []  # To store validation results for database names
    for line_number, line in enumerate(lines, start=1):
        stripped_line = line.strip()
        if "create database" in stripped_line.lower():  # Check if the line contains "create database"
            # Check if the line starts with "CREATE DATABASE" and extract the database name
            if stripped_line.lower().startswith("create database"):
                parts = stripped_line.split()
                if len(parts) > 2 and parts[2].startswith('[') and parts[2].endswith(']'):
                    db_name = parts[2][1:-1]  # Remove the brackets
                    timestamp = datetime.now().strftime(DATETIME_FORMAT)  # Get current timestamp
                    if validators.is_valid_create_database_statement(stripped_line):
                        results.append(f"-- {timestamp} - Line {line_number}: Passed - Database Name Convention for '{db_name}'")
                    else:
                        results.append(f"-- {timestamp} - Line {line_number}: Failed - Database Name Convention for '{db_name}'")
    return results


def create_processed_copy(tsql_file_path):

    # 
    # Creates a timestamped copy of the original T-SQL file with line numbers.
    # This function also ensures that all lines, including comments and empty lines, are numbered.

    # Args:
    #     tsql_file_path (str): The path to the original T-SQL file.

    # Returns:
    #     tuple: A tuple containing the new file name and the list of lines from the file.
    #

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

def process_validation_rules(lines, validators):
    # Log message for processing completion
    log_message("Processing complete (without validation).")

def main():
    # Ask the user for the path to the T-SQL file
    tsql_file_path = input("Enter the full path of the T-SQL file to process: ")

    # Ask the user for the rules file (default to 'rules.json' if no input)
    rules_file = input("Enter the full path of the rules JSON file (default: rules.json): ") or 'rules.json'

    # Load rules using the Rules class
    # rules = Rules(rules_file)  # Pass the file path to Rules

    # TODO - pass rules not the file
    # validators = Validators(rules_file)  # Pass the file path to Validators

    try:

         # Load rules using the Rules class
        rules_obj = Rules(rules_file)  # Automatically loads and validates the rules JSON

        # Initialize the Validators class with the loaded rules
        validators = Validators(rules = rules_obj)

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
