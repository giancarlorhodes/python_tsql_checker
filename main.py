

import json
import os

def load_rules_from_json(file_path):
    """Load and parse rules from a JSON file."""
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

def main():
    # Ask user for JSON file path
    file_path = input("Enter the JSON file path and name containing t-sql standard rules: ")

    # Load rules from the JSON file
    rules = load_rules_from_json(file_path)

    # If rules were successfully loaded, process them
    if rules is not None:
        print("Rules loaded successfully!")
        print(rules)  # For now, just print the rules
        
        # Here, you can add logic to process these rules
        # For example:
        # if 'some_rule' in rules:
        #     # Apply the rule's logic here
        #     print(f"Processing rule: {rules['some_rule']}")
        
    else:
        print("Failed to load rules. Exiting...")

if __name__ == "__main__":
    main()


