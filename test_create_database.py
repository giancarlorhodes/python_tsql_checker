import unittest
from validators import Validators

class TestCreateDatabaseStatements(unittest.TestCase):
    
    @classmethod
    def setUpClass(cls):
        # Provide the path to your rules.json file here
        cls.validators = Validators('rules.json')  # Create an instance of the Validators class with the JSON path

    def test_valid_create_database_statements(self):
        # List of valid CREATE DATABASE statements to test
        valid_statements = [
            'CREATE DATABASE [MdcProducts]',
            'CREATE DATABASE [WaterfowlReservation]'
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(self.validators.is_valid_create_database_statement(statement))  # Assert that the statement is valid

    def test_failing_database_statements(self):
        # List of invalid CREATE DATABASE statements to test
        failing_statements = [
            'DATABASE [WaterfowlReservation]',  # Missing CREATE
            'CREATE DATABASE [products]'  # Not PascalCase db name
        ]

        for statement in failing_statements:
            with self.subTest(statement=statement):
                self.assertFalse(self.validators.is_valid_create_database_statement(statement))  # Assert that the statement is invalid

if __name__ == '__main__':
    unittest.main(verbosity=2)  # Run the unit tests when the script is executed
