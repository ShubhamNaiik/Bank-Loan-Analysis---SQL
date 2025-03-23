SELECT	* 
FROM
	 bank_loan_data;
--------
SELECT 
		MONTH(issue_date) AS Month,
		DATENAME(MONTH,issue_date) AS Month_Name,
		COUNT(id) AS Total_Loan_Applications,
		SUM (loan_amount) AS Total_Funded_Amount,
		SUM	(total_payment) AS Total_Received_Amount
FROM	
		bank_loan_data
GROUP BY 
		DATENAME(MONTH,issue_date),MONTH(issue_date)
ORDER BY
		MONTH(issue_date);
---------
SELECT 
		address_state,
		COUNT(id) AS Total_Loan_Applications,
		SUM (loan_amount) AS Total_Funded_Amount,
		SUM	(total_payment) AS Total_Received_Amount
FROM	
		bank_loan_data
GROUP BY 
		address_state
ORDER BY
		SUM (loan_amount) DESC;
---------
SELECT 
		term,
		COUNT(id) AS Total_Loan_Applications,
		SUM (loan_amount) AS Total_Funded_Amount,
		SUM	(total_payment) AS Total_Received_Amount
FROM	
		bank_loan_data
GROUP BY 
		term
ORDER BY
		term;
---------
SELECT 
		emp_length,
		COUNT(id) AS Total_Loan_Applications,
		SUM (loan_amount) AS Total_Funded_Amount,
		SUM	(total_payment) AS Total_Received_Amount
FROM	
		bank_loan_data
GROUP BY 
		emp_length
ORDER BY
		COUNT(id) DESC;
---------
SELECT 
		purpose,
		COUNT(id) AS Total_Loan_Applications,
		SUM (loan_amount) AS Total_Funded_Amount,
		SUM	(total_payment) AS Total_Received_Amount
FROM	
		bank_loan_data
GROUP BY 
		purpose
ORDER BY
		COUNT(id) DESC;
---------
SELECT 
		home_ownership,
		COUNT(id) AS Total_Loan_Applications,
		SUM (loan_amount) AS Total_Funded_Amount,
		SUM	(total_payment) AS Total_Received_Amount
FROM	
		bank_loan_data
GROUP BY 
		home_ownership
ORDER BY
		COUNT(id) DESC;
