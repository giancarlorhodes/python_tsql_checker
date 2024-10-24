import unittest
from validators import Validators

class TestCreateTableStatements(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.validators = Validators('rules.json')  # Initialize Validators with rules.json

    def test_valid_procedure_statement(self):
        # List of valid procedures
        valid_statements = [
            'CREATE PROCEDURE [dbo].[uspCustOrderHist]',
            'CREATE     PROCEDURE [dbo].[uspCustOrdersDetail] @parmOrderID int',
            '          procedure   [dbo].[uspCustOrdersDetail] @parmOrderID int',
            'CREATE     PROCEDURE [dbo].[uspDetails] @parmOrderID int',
            'CREATE or alter    PROCEDURE [dbo].[uspCustUmerOrdersDetail] @parmOrderID int',
 
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(self.validators.is_valid_procedure_name_statement(statement))  # Assert that the statement is valid

   
    def test_failing_procedure_statement(self):
        # List of invalid procedure
        failing_statements = [
            'CREATE PROCEDURE [dbo].[usp_CustOrderHist]',
            'CREATE PROCEDURE [dbo].[CustOrderHist]',
            'CREATE     PROCEDURE [dbo].[spCustOrdersDetail] @parmOrderID int'
            'CREATE     PROCEDURE [dbo].[ORDER_DETAILS] @parmOrderID int',
            'CREATE or alter    PROCEDURE [dbo].[uspppCustUmerOrdersDetail] @parmOrderID int',
        ]

        for statement in failing_statements:
            with self.subTest(statement=statement):
                self.assertFalse(self.validators.is_valid_procedure_name_statement(statement))  # Assert that the statement is invalid

if __name__ == '__main__':
    unittest.main(verbosity=2)  # Run the unit tests when the script is executed
