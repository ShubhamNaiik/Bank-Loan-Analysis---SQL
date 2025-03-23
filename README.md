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

## Key Insights  
- December has the highest volume of loan applications and total funding  
- States like California and Texas top the list for funded loan amounts  
- Debt Consolidation and Credit Card are the leading loan purposes  
- Applicants with 10+ years of employment represent the largest group  
- Most applications fall under the 36-month loan term  

## Recommendations  
- Prioritize marketing in states with high loan demand and performance  
- Offer incentives to long-tenure employees who represent reliable borrowers  
- Tailor loan packages around the most common use cases like debt consolidation  
- Analyze risk and performance differences between loan terms (36 vs 60 months)  

## Conclusion  
This SQL project delivers the backend logic for a performance-focused dashboard, helping stakeholders monitor key financial metrics, identify trends, and drive loan product strategies. The insights derived can support credit risk analysis and marketing initiatives. **Future improvements** could include integrating borrower credit scores and loan repayment status for predictive modeling.
