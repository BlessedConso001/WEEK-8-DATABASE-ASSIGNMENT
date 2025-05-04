-- ***************************************************************************************************************
--                QUESTION 1: CREATING A COMPLETE DATABASE MANAGEMENT SYSYTEM🤗🤗🤗🤗
-- ***************************************************************************************************************

CREATE DATABASE Bankdb;
USE Bankdb;

-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
) AUTO_INCREMENT = 2020201;

-- Accounts Table
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) AUTO_INCREMENT = 1011015;

-- Payment Methods Table
CREATE TABLE payment_methods (
    payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transaction Fees Table
CREATE TABLE transaction_fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method_id INT,
    transaction_type VARCHAR(20),
    fee_amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id)
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    fee_id INT,
    payment_method_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (fee_id) REFERENCES transaction_fees(fee_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id)
) AUTO_INCREMENT = 101;

-- Insert Customers (with Gmail)
INSERT INTO customers (first_name, last_name, email) VALUES
('Mwangi', 'Kamau', 'mwangi.kamau@gmail.com'),
('Achieng', 'Otieno', 'achieng.otieno@gmail.com'),
('Mutiso', 'Wambua', 'mutiso.wambua@gmail.com'),
('Wanjiku', 'Njeri', 'wanjiku.njeri@gmail.com'),
('Kiptoo', 'Cheruiyot', 'kiptoo.cheruiyot@gmail.com'),
('Makena', 'Muthoni', 'makena.muthoni@gmail.com');

-- Insert Accounts
INSERT INTO accounts (customer_id, account_type, balance) VALUES
(2020201, 'savings', 30500.00),
(2020202, 'checking', 12800.50),
(2020203, 'savings', 43000.00),
(2020204, 'loan', -15000.00),
(2020205, 'checking', 9800.75),
(2020206, 'savings', 22500.00);

-- Insert Payment Methods
INSERT INTO payment_methods (method_name) VALUES
('M-Pesa'),
('Bank Transfer'),
('Airtel Money'),
('Card Payment'),
('Cheque'),
('Cash Deposit');

-- Insert Transaction Fees
INSERT INTO transaction_fees (payment_method_id, transaction_type, fee_amount) VALUES
(1, 'deposit', 10.00),
(2, 'transfer', 25.00),
(3, 'withdrawal', 15.00),
(4, 'payment', 30.00),
(5, 'deposit', 20.00),
(6, 'withdrawal', 5.00);

-- Insert Transactions
INSERT INTO transactions (account_id, fee_id, payment_method_id, amount) VALUES
(1011015, 1, 1, 1000.00),
(1011016, 2, 2, 2500.00),
(1011017, 3, 3, 1200.00),
(1011018, 4, 4, 3000.00),
(1011019, 5, 5, 4500.00),
(1011020, 6, 6, 2000.00);

-- ****************************************************************************************************************************
--   END OF QUESTION ONE 🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗
-- ********************************************************************************************************************