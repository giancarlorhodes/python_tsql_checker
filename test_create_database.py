
import unittest
from validators import is_valid_create_database_statement

class TestCreateDatabaseStatements(unittest.TestCase):
    
    def test_valid_create_database_statements(self):
        # List of valid CREATE TABLE statements to test
        valid_statements = [
            'CREATE DATABASE [MdcProducts]',
            'CREATE DATABASE [WaterfowlReservation]'
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(is_valid_create_database_statement(statement))  # Assert that the statement is valid

    def test_failing_database_table_statements(self):
        # List of invalid CREATE DATABASE statements to test
        failing_statements = [
            'DATABASE [WaterfowlReservation]',  # missing CREATE
            'CREATE DATABASE [products]'  # not pascal case db name
        ]

        for statement in failing_statements:
            with self.subTest(statement=statement):
                self.assertFalse(is_valid_create_database_statement(statement))  # Assert that the statement is invalid

if __name__ == '__main__':
    unittest.main(verbosity=2)  # Run the unit tests when the script is executed
