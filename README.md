# Bank-Loan-Analysis---SQL

##  Introduction  
This SQL-based project focuses on analyzing bank loan application data to identify trends, assess financial performance, and understand customer behavior. The queries are designed to power a dashboard that provides actionable insights for loan product strategy and operational improvement.

## Objective  
The objective of this project is to build a comprehensive SQL-driven backend for a bank loan performance dashboard.  
By querying historical loan application data, the project uncovers key patterns in funding, payment, customer attributes, and loan terms.

## Dataset Overview  
The primary dataset used is `bank_loan_data`, which contains the following columns:

| Column Name     | Description                                      |
|------------------|--------------------------------------------------|
| `id`             | Unique identifier for each loan                 |
| `issue_date`     | Date when the loan was issued                   |
| `loan_amount`    | Amount funded to the customer                   |
| `total_payment`  | Amount received from the customer               |
| `term`           | Loan term (e.g., 36 or 60 months)               |
| `emp_length`     | Length of employment of the borrower            |
| `purpose`        | Purpose of the loan (e.g., debt consolidation)  |
| `home_ownership` | Type of home ownership (Rent, Own, Mortgage)    |
| `address_state`  | US state from which the loan was applied        |

## Core Questions Answered  
1. What is the total loan volume issued per month?
2. Which US states have the highest loan issuance?
3. What are the most common purposes for loan applications?
4. How does employment length correlate with loan volume?
5.  How do term types and home ownership status impact funding and payments?

## SQL Queries and Analysis

### 1. Retrieve All Data
   
-- 1. Retrieve all data from the bank loan dataset.
```sql
SELECT	* 
FROM
	 bank_loan_data;
````

Explanation: This query retrieves all the records from the bank_loan_data table, displaying the full dataset.

![image](https://github.com/user-attachments/assets/c92a6c60-6911-4214-8ba0-95fb2c2284ed)


### 2. Total Loan Volume Issued Per Month
```sql
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
```

Explanation: This query calculates the total number of loan applications, the total funded amount, and the total received payment for each month.

![image](https://github.com/user-attachments/assets/2ad660cd-7480-41cb-970b-43a58f783f22)

**Key Insight**: December shows the highest volume of loan applications and total funding.

### 3. Loan Issuance by US State
```sql
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
```
Explanation: This query calculates the total number of loan applications, total funded amount, and total received payment for each state. The results are ordered by the total loan amount in descending order.

![image](https://github.com/user-attachments/assets/ebe71b35-f457-492c-b048-32f92c40bdd6)

**Key Insight**: States like California and Texas are at the top for funded loan amounts.

### 4. Loan Term and Funding Analysis
```sql
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
```
Explanation: This query analyzes the loan term (e.g., 36 or 60 months), calculating the total number of loan applications, the total funded amount, and total payment for each term.

![image](https://github.com/user-attachments/assets/c4043239-f170-46e8-b64e-e27c479f6f61)

•	Key Insight: Most applications fall under the 36-month loan term.

### 5. Loan Issuance by Employment Length
```sql
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
```
Explanation: This query evaluates the relationship between the borrower's length of employment and the loan volume. It calculates the number of loan applications, total funded amount, and total received payment by employment length.

![image](https://github.com/user-attachments/assets/05e3f571-24da-440e-b9f5-41e240d00b1b)

•	Key Insight: Borrowers with 10+ years of employment represent the largest group of applicants.

6. Most Common Loan Purposes
```SQL
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
```
Explanation: This query identifies the most common purposes for loan applications by calculating the number of applications, the total funded amount, and total payments for each loan purpose.

![image](https://github.com/user-attachments/assets/5110ace7-39a7-47fe-8f46-0ddd7ebf9359)

 
•	Key Insight: Debt Consolidation and Credit Card are the leading loan purposes.
________________________________________
7. Loan Issuance by Home Ownership Status
Query:
```SQL
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
Explanation: This query explores how home ownership status (Rent, Own, Mortgage) affects loan issuance, funding, and payments.
```
![image](https://github.com/user-attachments/assets/a3a2802b-08dd-47c5-9be6-94a5f0533d25)

 
•	Key Insight: Most applicants are homeowners or have a mortgage.


## Key Insights  
- December has the highest volume of loan applications and total funding  
- States like California and Texas top the list for funded loan amounts  
- Debt Consolidation and Credit Card are the leading loan purposes  
- Applicants with 10+ years of employment represent the largest group  
- Most applications fall under the 36-month loan term
- Most applicants are homeowners or have a mortgage 

## Recommendations  
- Prioritize marketing in states with high loan demand and performance  
- Offer incentives to long-tenure employees who represent reliable borrowers  
- Tailor loan packages around the most common use cases like debt consolidation  
- Analyze risk and performance differences between loan terms (36 vs 60 months)  

## Conclusion  
This SQL project delivers the backend logic for a performance-focused dashboard, helping stakeholders monitor key financial metrics, identify trends, and drive loan product strategies. The insights derived can support credit risk analysis and marketing initiatives. **Future improvements** could include integrating borrower credit scores and loan repayment status for predictive modeling.
