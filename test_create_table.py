import unittest
from validators import Validators

class TestCreateTableStatements(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.validators = Validators('rules.json')  # Initialize Validators with rules.json

    def test_valid_create_table_statements(self):
        # List of valid CREATE TABLE statements to test
        valid_statements = [
            'CREATE TABLE [dbo].[tblkProducts]',
            'CREATE TABLE [dbo].[tblOrders]',
            'CREATE TABLE [dbo].[tblkCustomers]',
            'CREATE TABLE [dbo].[tblInvoices]',
            'CREATE TABLE [dbo].[tblkSuppliers]'
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(self.validators.is_valid_create_table_statement(statement))  # Assert that the statement is valid

    def test_valid_create_table_statements_v2(self):
        # List of valid CREATE TABLE statements to test
        valid_statements = [
            'CREATE TaBlE [dbo].[tblkProducts]',
            'CREATE TABLE [dbo].[tblOrders]',
            'CrEATE TABLE [dbo].[tblkCustomers]',
            'CREATE taBle [dbo].[tblInvoices]',
            'create table [dbo].[tblkSuppliers]'
        ]

        for statement in valid_statements:
            with self.subTest(statement=statement):
                self.assertTrue(self.validators.is_valid_create_table_statement_v2(statement))  # Assert that the statement is valid

    def test_failing_create_table_statements(self):
        # List of invalid CREATE TABLE statements to test
        failing_statements = [
            'TABLE [dbo].[tblkProducts]',  # Missing CREATE
            'CREATE TABLE [myschema].[tblkProducts]',  # Incorrect schema
            'CREATE TABLE [dbo].[prodProducts]',  # Invalid prefix
            'CREATE TABLE [dbo].[tblkproducts]',  # Lowercase starting letter
            'CREATE TABLE [dbo].[tblkProducts123]'  # Includes digits
        ]

        for statement in failing_statements:
            with self.subTest(statement=statement):
                self.assertFalse(self.validators.is_valid_create_table_statement(statement))  # Assert that the statement is invalid

if __name__ == '__main__':
    unittest.main(verbosity=2)  # Run the unit tests when the script is executed
