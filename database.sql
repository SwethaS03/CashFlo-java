DROP DATABASE IF EXISTS bank;

CREATE DATABASE bank;

USE bank;

 -- USERS TABLE STRUCTURE
CREATE TABLE users(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(150) NOT NULL,
    token VARCHAR(250) NULL,
    code INT NULL,
    verified INT DEFAULT 0,
    verified_at DATETIME,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NOW()
);

 -- bank account table structure
 
 CREATE TABLE accounts(
	account_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    account_number VARCHAR(50) NOT NULL,
    account_name VARCHAR(50) NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(18,2) DEFAULT 0.00,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

 /* Transaction histroy table */
 
 CREATE TABLE transaction_history(
	transaction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50) NOT NULL,
    amount DECIMAL(18,2), /* no history unless account created */
    source VARCHAR(50) NULL,
    status VARCHAR(50) NULL, /*success or failure*/
    reason_code VARCHAR(150) NULL, /*INSUFFICIENT FUNDS*/
    created_at TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);

/* payments table structure */

CREATE TABLE payments(
	payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    beneficiary VARCHAR(50) NULL,
    beneficiary_acc_no VARCHAR(100) NULL, /* no history unless account created */
    amount DECIMAL(18,2) NULL,
    reference_no VARCHAR(150) NULL,
    status VARCHAR(50) NULL, /*success or failure*/
    reason_code VARCHAR(150) NULL, /*INSUFFICIENT FUNDS*/
    created_at TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);

 -- transaction history view
 
CREATE VIEW v_transaction_history
AS
SELECT 
	t.transaction_id,
    a.account_id,
    u.user_id,
    t.transaction_type,
    t.amount,
    t.source,
    t.status,
    t.reason_code,
    t.created_at
FROM transaction_history AS t
INNER JOIN accounts AS a
ON t.account_id = a.account_id
INNER JOIN users AS u
ON a.user_id = u.user_id;

-- payment history view

CREATE VIEW v_payments
AS 
SELECT 
	p.payment_id,
    a.account_id,
    u.user_id,
    p.beneficiary,
    p.beneficiary_acc_no,
    p.amount,
	p.status,
    p.reference_no,
    p.reason_code,
    p.created_at
FROM payments AS p
INNER JOIN accounts AS a
ON p.account_id = a.account_id
INNER JOIN users AS u
ON a.user_id = u.user_id;

select * from v_transaction_history;

select * from v_payments;