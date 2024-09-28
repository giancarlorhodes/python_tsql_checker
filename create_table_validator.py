

# regular expression libaray
import re

def is_valid_create_table_statement(statement):
    """Check if the statement is a valid CREATE TABLE statement."""
    pattern = r'^CREATE\s+TABLE\s+\[dbo\]\.\[(tblk|tbl)[A-Z][a-zA-Z]*\]'
    return bool(re.match(pattern, statement))
