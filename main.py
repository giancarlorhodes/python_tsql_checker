import json
import sys
import os
from shutil import copyfile
from datetime import datetime

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
    
def create_processed_copy(tsql_file_path):
    """Create a copy of the T-SQL file with a timestamp and add line numbers."""
    # Extract the file name and extension
    file_name, file_ext = os.path.splitext(tsql_file_path)
    
    # Generate a timestamp in the format MMDDYYYYHHMMSS
    timestamp = datetime.now().strftime("%m%d%Y%H%M%S")
    
    # Create the new file name with the timestamp
    new_file_name = f"{file_name}_processed_{timestamp}{file_ext}"
    
    # Copy the original file to the new file
    copyfile(tsql_file_path, new_file_name)
    
    # Add line numbers to the copied file
    with open(new_file_name, 'r') as file:
        lines = file.readlines()
    
    with open(new_file_name, 'w') as file:
        for idx, line in enumerate(lines, 1):
            # Prepend each line with the line number and two spaces
            file.write(f"{idx}  {line}")
    
    print(f"File copied and updated with line numbers: {new_file_name}")
    return new_file_name

def main():
    # Ask the user for the path to the T-SQL file
    tsql_file_path = input("Enter the full path of the T-SQL file to process: ")

    # Ask the user for the rules file (default to 'rules.json' if no input)
    rules_file = input("Enter the full path of the rules JSON file (rules.json): ") or 'rules.json'

    try:
        # Create a timestamped copy of the T-SQL file
        processed_file_path = create_processed_copy(tsql_file_path)

        # Load validation rules
        rules = load_rules_from_json(rules_file)

       

    except FileNotFoundError as e:
        print(f"Error: {e}")
    except json.JSONDecodeError:
        print(f"Error: Invalid JSON file at {rules_file}")

if __name__ == "__main__":
    main()

