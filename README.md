

your_project/
├── create_table_validator.py   # regular expression libaray
├── main.py                     # The main Python application
├── rules.json                  # JSON file containing the validation rules
├── create_table_validator.py   # Validation logic for SQL statements
├── test_create_table.py        # Unit tests for the validation logic
└── README.md                   # Project documentation



# HIGH LEVEL STEPS
1. load the rules from a file
2. get the name and path of the t-sql file to process on
 create a copy of the t-sql file call orginalname_datetimestamp_processed.sql
 number the each line in the copy file line by line
 add a log section t-sql comment at the end of the copy that describes each step
 first line in the log will say "added line numbers"
 
