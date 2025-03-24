-- ============================================
-- Bank Loan Analysis SQL Queries
--- Author: Shubham Naik
-- ============================================

-- 1. Retrieve all data from the bank loan dataset.
SELECT	* 
FROM
	 bank_loan_data;

-- ============================================
-- 2. Total Loan Volume Issued Per Month
-- ============================================
SELECT 
    MONTH(issue_date) AS Month,  -- Extract month number
    DATENAME(MONTH, issue_date) AS Month_Name,  -- Get the month name
    COUNT(id) AS Total_Loan_Applications,  -- Count of loans issued
    SUM(loan_amount) AS Total_Funded_Amount,  -- Total amount funded by the bank
    SUM(total_payment) AS Total_Received_Amount  -- Total amount paid back by customers
FROM	
    bank_loan_data
GROUP BY 
    DATENAME(MONTH, issue_date), MONTH(issue_date)
ORDER BY
    MONTH(issue_date);  -- Order by month number

-- ============================================
-- 3. Loan Issuance by US State
-- ============================================
SELECT 
    address_state,  -- State where loan was applied
    COUNT(id) AS Total_Loan_Applications,  -- Number of loan applications from each state
    SUM(loan_amount) AS Total_Funded_Amount,  -- Total amount funded in each state
    SUM(total_payment) AS Total_Received_Amount  -- Total payment received from borrowers in each state
FROM	
    bank_loan_data
GROUP BY 
    address_state  -- Group by state
ORDER BY
    SUM(loan_amount) DESC;  -- Order by total loan amount funded in descending order

-- ============================================
-- 4. Loan Term and Funding Analysis
-- ============================================
SELECT 
    term,  -- Loan term in months (e.g., 36 or 60 months)
    COUNT(id) AS Total_Loan_Applications,  -- Number of loan applications for each term
    SUM(loan_amount) AS Total_Funded_Amount,  -- Total funded amount for each term
    SUM(total_payment) AS Total_Received_Amount  -- Total payment received for each term
FROM	
    bank_loan_data
GROUP BY 
    term  -- Group by loan term
ORDER BY
    term;  -- Order by loan term in ascending order

-- ============================================
-- 5. Loan Issuance by Employment Length
-- ============================================
SELECT 
    emp_length,  -- Employment length of the borrower
    COUNT(id) AS Total_Loan_Applications,  -- Number of loan applications for each employment length
    SUM(loan_amount) AS Total_Funded_Amount,  -- Total funded amount for each employment length
    SUM(total_payment) AS Total_Received_Amount  -- Total payment received for each employment length
FROM	
    bank_loan_data
GROUP BY 
    emp_length  -- Group by employment length
ORDER BY
    COUNT(id) DESC;  -- Order by number of loan applications in descending order

-- ============================================
-- 6. Most Common Loan Purposes
-- ============================================
SELECT 
    purpose,  -- Purpose of the loan (e.g., debt consolidation, home improvement)
    COUNT(id) AS Total_Loan_Applications,  -- Number of loan applications for each purpose
    SUM(loan_amount) AS Total_Funded_Amount,  -- Total funded amount for each purpose
    SUM(total_payment) AS Total_Received_Amount  -- Total payment received for each purpose
FROM	
    bank_loan_data
GROUP BY 
    purpose  -- Group by loan purpose
ORDER BY
    COUNT(id) DESC;  -- Order by the number of loan applications in descending order

-- ============================================
-- 7. Loan Issuance by Home Ownership Status
-- ============================================
SELECT 
    home_ownership,  -- Type of home ownership (e.g., Rent, Own, Mortgage)
    COUNT(id) AS Total_Loan_Applications,  -- Number of loan applications for each home ownership type
    SUM(loan_amount) AS Total_Funded_Amount,  -- Total funded amount for each home ownership type
    SUM(total_payment) AS Total_Received_Amount  -- Total payment received for each home ownership type
FROM	
    bank_loan_data
GROUP BY 
    home_ownership  -- Group by home ownership type
ORDER BY
    COUNT(id) DESC;  -- Order by the number of loan applications in descending order
