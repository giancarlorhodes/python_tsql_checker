# rules.py

import json
import os

class Rule:
    def __init__(self, key, version, name, description, pattern, related_to):
        self.key = key
        self.version = version
        self.name = name
        self.description = description
        self.pattern = pattern
        self.related_to = related_to

    def __repr__(self):
        return f"Rule(key={self.key}, version={self.version}, name={self.name})"


class Rules:
    def __init__(self, json_file_path):
        self.rules = set()  # Use a set to store unique rules
        self.load_rules_from_json(json_file_path)

    def load_rules_from_json(self, file_path):
        # Load and parse rules from a JSON file.
        if not os.path.exists(file_path):
            print(f"Error: File '{file_path}' does not exist.")
            return

        try:
            with open(file_path, 'r') as file:
                data = json.load(file)
                for rule_data in data['rules']:
                    rule = Rule(
                        key=rule_data['key'],
                        version=rule_data['version'],
                        name=rule_data['name'],
                        description=rule_data['description'],
                        pattern=rule_data['pattern'],
                        related_to=rule_data.get('related_to')
                    )
                    self.rules.add(rule)  # Add rule object to the set
        except json.JSONDecodeError as e:
            print(f"Error: Failed to parse JSON file. {e}")

    def get_rules(self):
        # Return a set of loaded rules.
        return self.rules
