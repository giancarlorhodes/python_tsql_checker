import unittest
from validators import Validators

class TestCreateTableStatements(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.validators = Validators('rules.json')  # Initialize Validators with rules.json

    def test_valid_column_statement(self):
        # List of valid columns
        valid_statements = [
            '[QuantityPerUnit] [nvarchar](20) NULL',
 	        '[UnitPrice] [money] NULL',
            '[UnitsInStock] [smallint] NULL'  
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(self.validators.is_valid_column_name_statement(statement))  # Assert that the statement is valid

   
    def test_failing_column_statement(self):
        # List of invalid columns
        failing_statements = [
            '[ProductID] [int] IDENTITY(1,1) NOT NULL',
            '[SupplierID] [int] NULL',
  	        '[CategoryID] [int] NULL',
            '[category] [int] NULL',
            '[this should fail] [bigint] NOT NULL'  
        ]

        for statement in failing_statements:
            with self.subTest(statement=statement):
                self.assertFalse(self.validators.is_valid_column_name_statement(statement))  # Assert that the statement is invalid

if __name__ == '__main__':
    unittest.main(verbosity=2)  # Run the unit tests when the script is executed
