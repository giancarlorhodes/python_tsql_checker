import unittest
from validators import Validators

class TestCreateTableStatements(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.validators = Validators('rules.json')  # Initialize Validators with rules.json

    def test_valid_view_statement(self):
        # List of valid view
        valid_statements = [
            'VIEW [dbo].[vwCustomerAndSuppliersByCity]',
            'VIEW [dbo].[vwCurrentProductList]',
            '   VIEW [dbo].[vwCurrentProductList]    ',
            'CREATE VIEW [dbo].[vwOrdersQry]',
            'ALTER VIEW [dbo].[vwOrdersQry]'
 
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(self.validators.is_valid_view_name_statement(statement))  # Assert that the statement is valid

   
    def test_failing_valid_view_statement(self):
        # List of invalid view
        failing_statements = [
            'VIEW [dbo].[vw Customer And Suppliers By City]',
            ' CREATE VIEW [dbo].[ViewCurrentProductList]',
            'ALTER VIEW [dbo].[current_ProductList]     ',
            ' CREATE OR ALTER VIEW [dbo].[vwmProductList]  '
        ]

        for statement in failing_statements:
            with self.subTest(statement=statement):
                self.assertFalse(self.validators.is_valid_view_name_statement(statement))  # Assert that the statement is invalid

if __name__ == '__main__':
    unittest.main(verbosity=2)  # Run the unit tests when the script is executed
