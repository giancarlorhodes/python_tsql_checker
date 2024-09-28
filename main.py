import json
import sys
import os
from shutil import copyfile
from datetime import datetime

# Global list for log entries
log_entries = []


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
    """Check if a line is a comment."""
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
    timestamped_message = f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - {message}"
    log_entries.append(f"-- {timestamped_message}")

def create_processed_copy(tsql_file_path):
    """Create a copy of the T-SQL file with a timestamp and add line numbers, skipping comment lines."""
    # Extract the file name and extension
    file_name, file_ext = os.path.splitext(tsql_file_path)
    
    # Generate a timestamp in the format DDMMYYYYHHMMSS
    timestamp = datetime.now().strftime("%d%m%Y%H%M%S")
    
    # Create the new file name with the timestamp
    new_file_name = f"{file_name}_processed_{timestamp}{file_ext}"
    
    # Copy the original file to the new file
    copyfile(tsql_file_path, new_file_name)
    
    # Add line numbers to the copied file, skipping comment lines
    with open(new_file_name, 'r') as file:
        lines = file.readlines()
    
    # Open the file again to write updated content and log
    with open(new_file_name, 'w') as file:
        line_number = 1
        for line in lines:
            if not is_comment(line):
                # Only number lines that are not comments
                file.write(f"{line_number}  {line}")
                line_number += 1
            else:
                # Write comment lines without numbering
                file.write(line)

        # Log processing message
        log_message(f"File copied and updated with line numbers (comments skipped): {new_file_name}")

        # Write the processing log to the end of the file
        file.write("\n-- Processing Log --\n")
        for entry in log_entries:
            file.write(f"{entry}\n")

    return new_file_name


def main():
    # Ask the user for the path to the T-SQL file
    tsql_file_path = input("Enter the full path of the T-SQL file to process: ")

    # Ask the user for the rules file (default to 'rules.json' if no input)
    rules_file = input("Enter the full path of the rules JSON file (default: rules.json): ") or 'rules.json'

    try:
        # Create a timestamped copy of the T-SQL file and add line numbers
        create_processed_copy(tsql_file_path)

        # At this point, we are delaying reading the T-SQL statements or validating them
        log_message("Processing complete (without validation).")

    except FileNotFoundError as e:
        log_message(f"Error: {e}")
    except json.JSONDecodeError:
        log_message(f"Error: Invalid JSON file at {rules_file}")

    # Print final log entries to the console
    for entry in log_entries:
        print(entry)

if __name__ == "__main__":
    main()