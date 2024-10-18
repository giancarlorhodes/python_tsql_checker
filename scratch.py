


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


def load_rules_from_json(file_path):
    # Load and parse rules from a JSON file.
    if not os.path.exists(file_path):
        print(f"Error: File '{file_path}' does not exist.")
        return None
    
    try:
        with open(file_path, 'r') as file:
            rules = json.load(file)
            return rules
    except json.JSONDecodeError as e:
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
        if stripped_line.lower().startswith("create database"):  # Check case-insensitively
            # Extract the database name from the line
            parts = stripped_line.split()
            if len(parts) > 2 and parts[2].startswith('[') and parts[2].endswith(']'):
                db_name = parts[2][1:-1]  # Remove the brackets
                if validators.is_valid_create_database_statement(stripped_line):
                    results.append(f"Line {line_number}: Passed - Database Name Convention for '{db_name}'")
                else:
                    results.append(f"Line {line_number}: Failed - Database Name Convention for '{db_name}'")
    return results



def create_processed_copy(tsql_file_path, validators):
    # Create a copy of the T-SQL file with a timestamp and add line numbers, including comments and empty lines.
    # Extract the file name and extension
    file_name, file_ext = os.path.splitext(tsql_file_path)
    
    # Generate a timestamp for the filename (without colons)
    timestamp_for_filename = datetime.now().strftime("%m%d%Y%H%M%S")
    
    # Create the new file name with the timestamp
    new_file_name = f"{file_name}_processed_{timestamp_for_filename}{file_ext}"
    
    # Copy the original file to the new file
    copyfile(tsql_file_path, new_file_name)
    
    results = []  # To store validation results

    # Add line numbers to the copied file, including comments and empty lines
    with open(new_file_name, 'r') as file:
        lines = file.readlines()
    
    with open(new_file_name, 'w') as file:
        for line_number, line in enumerate(lines, start=1):  # Start numbering from 1
            # Write every line with its corresponding line number
            file.write(f"{line_number}  {line}")

            # Validate the line based on the rules
            if validators.is_valid_create_database_statement(line.strip()):
                results.append(f"Line {line_number}: Passed - Database Name Convention")
            else:
                results.append(f"Line {line_number}: Failed - Database Name Convention")

    # Validate the database name from CREATE DATABASE statements
    results.extend(processing_database_name(lines, validators))

    # Log processing message
    log_message(f"File copied and updated with line numbers (including all lines): {new_file_name}")

    # Write validation results at the end of the file
    with open(new_file_name, 'a') as file:
        file.write("\n-- Validation Results --\n")
        for result in results:
            file.write(f"{result}\n")

    return new_file_name


def main():
    # Ask the user for the path to the T-SQL file
    tsql_file_path = input("Enter the full path of the T-SQL file to process: ")

    # Ask the user for the rules file (default to 'rules.json' if no input)
    rules_file = input("Enter the full path of the rules JSON file (default: rules.json): ") or 'rules.json'

    # Load rules and create validators
    rules = load_rules_from_json(rules_file)
    validators = Validators(rules)  # Pass loaded rules to Validators

    try:
        # Create a timestamped copy of the T-SQL file and add line numbers, validating lines
        new_file_name = create_processed_copy(tsql_file_path, validators)

        # Log message for processing completion
        log_message("Processing complete (with validation).")

        # Write processing log to both console and file
        write_processing_log(new_file_name)

    except FileNotFoundError as e:
        log_message(f"Error: {e}")
        write_processing_log(new_file_name)  # Write log even if there's an error

    except json.JSONDecodeError:
        log_message(f"Error: Invalid JSON file at {rules_file}")
        write_processing_log(new_file_name)  # Write log even if there's an error


def write_processing_log(new_file_name):
    # Print each log entry to the console
    for entry in log_entries:
        print(entry)

    # Write the processing log to the end of the copied file
    with open(new_file_name, 'a') as file:  # Open in append mode
        file.write("\n-- Processing Log --\n")
        for entry in log_entries:
            file.write(f"{entry}\n")


if __name__ == "__main__":
    main()
