

# regular expression libaray
import re


# TO DO the pattern should be pulled from rules.json
def is_valid_create_table_statement(statement):
    # Check if the statement is a valid CREATE TABLE statement.
    pattern = r'^CREATE\s+TABLE\s+\[dbo\]\.\[(tblk|tbl)[A-Z][a-zA-Z]*\]'
    return bool(re.match(pattern, statement))

def is_valid_create_table_statement_v2(statement):
    # Check if the statement is a valid CREATE TABLE statement.
    pattern = r'^([cC][rR][eE][aA][tT][eE]\s+[tT][aA][bB][lL][eE])\s+\[dbo\]\.\[(tblk|tbl)[A-Z][a-zA-Z]*\]'
    return bool(re.match(pattern, statement))



def is_valid_create_database_statement(statement):
    # Check if the statement is a valid CREATE DATABASE statement.
    pattern = r'^([cC][rR][eE][aA][tT][eE]\s+[dD][aA][tT][aA][bB][aA][sS][eE])\s+\[[A-Z][a-z]*(?:[A-Z][a-z]*)*\]$'
    return bool(re.match(pattern, statement))
