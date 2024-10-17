
# validators.py

import re
from rules import Rules

class Validators:
    def __init__(self, rules_json_path):
        self.rules = Rules(rules_json_path).get_rules()

    def is_valid_create_table_statement(self, statement):
        # Get the pattern for the Create Table rule (version 1 or 2)
        for rule in self.rules:
            if rule.name == "Create Table Naming Convention" and rule.version == 1:
                pattern = rule.pattern
                break
        else:
            raise ValueError("Create Table Naming Convention rule not found.")
        
        return bool(re.match(pattern, statement))

    def is_valid_create_table_statement_v2(self, statement):
        # Get the pattern for the Create Table rule version 2
        for rule in self.rules:
            if rule.name == "Create Table Naming Convention v2" and rule.version == 2:
                pattern = rule.pattern
                break
        else:
            raise ValueError("Create Table Naming Convention v2 rule not found.")
        
        return bool(re.match(pattern, statement))

    def is_valid_create_database_statement(self, statement):
        # Get the pattern for the Database Name Convention rule
        for rule in self.rules:
            if rule.name == "Database Name Convention" and rule.version == 1:
                pattern = rule.pattern
                break
        else:
            raise ValueError("Database Name Convention rule not found.")
        
        return bool(re.match(pattern, statement))
