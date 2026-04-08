/*
-------------------------------------------------------------------------------
Project:      Retail Banking Attrition Analysis (Canada)
Author:       Katherine Patadee (Pew)
Date:         2026-03-30
Description:  Initial database setup, schema optimization, and churn analysis.

EXECUTIVE SUMMARY:
- Overall churn rate is 20.37%, exceeding industry benchmark (15%)
- Quebec market is the primary risk driver with 32.44% churn
- Customers with 3+ products show extremely high churn (82%–100%)
- High-balance customers (100k+) are both high-value and high-risk
- Estimated total balance lost due to churn is approximately $185.6M (~24% of total bank deposits)


Business Impact:
- Revenue leakage is concentrated in high-value segments and Quebec region
- Immediate retention strategies could significantly reduce financial loss

BUSINESS PROBLEMS & OBJECTIVES:
1. OVERALL CHURN RATE: The bank is experiencing a 20.37% churn rate, 
   significantly exceeding the industry benchmark of 15%.
   
2. REGIONAL DISPARITY: Identify why the Quebec market
   shows a churn rate double that of Ontario, posing a risk to regional capital.
   
3. PRODUCT FRICTION: Investigate the "Over-Selling" hypothesis—why customers 
   with 3 or more products have a significantly higher probability of leaving.
   
4. HIGH-VALUE INACTIVITY: Identify clients (Balances > $150k) 
   who are currently inactive to prevent the loss of high-yield accounts.
-------------------------------------------------------------------------------
DATA DICTIONARY:
- customer_id (NVARCHAR): Unique identifier for the bank client.(10,000)
- credit_score (INT): Numerical score representing creditworthiness (350-850).
- province (NVARCHAR): Localized region (Ontario, Quebec, British Columbia).
- gender (NVARCHAR): Customer gender (Male/Female).
- age (INT): Customer age in years.
- tenure (INT): Years as a bank client (Calculated as an Integer).
- balance (FLOAT): Current account balance in CAD.
- products_number (INT): Count of active bank products held.
- credit_card (INT): Binary flag (1 = Has Card, 0 = No Card).
- active_member (INT): Engagement flag (1 = Active, 0 = Inactive).
- estimated_salary (FLOAT): Modeled annual income in CAD.
- churn (INT): Target Variable (1 = Exited, 0 = Retained).
-------------------------------------------------------------------------------
*/
-- Deploy the database
USE BankingAnalytics;
GO
-- Identify Churn Rate
SELECT SUM(churn) AS total_churned,
	   COUNT(*) AS total_customers,
	   CAST(SUM(churn) AS FLOAT)*100/COUNT(*) AS churn_rate -- Change total churn to float data type to force decimal format
FROM Customer_Churn;

--Identify why the Quebec market shows a churn rate double that of Ontario
SELECT province,
	   ROUND(CAST(SUM(churn) AS FLOAT)*100/COUNT(*),2) AS churn_rate,
	   ROUND(AVG(balance),2) AS avg_balance,
	   ROUND(AVG(estimated_salary),2) AS avg_estimated_salary,
	   SUM(active_member) AS active_member,
	   AVG(credit_score) AS avg_credit_score,
	   ROUND(AVG(CAST(credit_card AS FLOAT)) * 100, 2) AS Penetration_Rate,
	   AVG(products_number) AS avg_products_number,
	   AVG(age) AS avg_age,
	   AVG(tenure) AS avg_tenure
FROM Customer_Churn
WHERE province IN ('Quebec', 'Ontario')
GROUP BY province;

/* ===============================================================================
FINDINGS
===============================================================================
1. Quebec is the 'leakiest bucket' with a 32.44% churn rate, 
   exactly double the Ontario baseline (16.15%).
   
2. Churn is concentrated in high-value accounts. The average 
   Quebec balance is $119k vs. $62k in Ontario, meaning we are losing our 
   most profitable customers.

3. Despite high balances, Quebec customers show lower 
   active engagement. They are using the bank as a 'savings vault' rather 
   than a primary financial partner, making them easier to poach.

Strategic recommendations:
Implement a 'Multi-Product' bundle incentive in Quebec to move single-product 
holders (avg 1.0) to a second product (Credit Card or Mortgage) to increase 
account 'stickiness.'
===============================================================================
*/

-- Investigate the root causes customer with 3 or more products have high potential of leaving 
SELECT
	   products_number,
	   ROUND(CAST(SUM(churn) AS FLOAT)*100/COUNT(*),2) AS churn_rate,
	   COUNT(*) AS total_num_customer,
	   SUM(active_member) AS active_member,
	   ROUND(CAST(SUM(active_member)*100 AS FLOAT)/COUNT(*),2) AS engagement_rate
FROM Customer_Churn
GROUP BY products_number
ORDER BY products_number DESC;

/* ===============================================================================
FINDINGS
===============================================================================
1. Customers with 2 products have the lowest churn rate (7.58%) and the highest engagement rate (53.29%).
2. Churn increases sharply to 82.7% for customers with 3 products, alongside a ~11% drop in engagement rate, and reaches 100% for customers with 4 products. 

Strategic recommendations:
1. Focus on targeted marketing campaigns to encourage 1-product customers (27.7% churn rate) to adopt a second product, 
improving customer retention and engagement.
2. Immediately investigate the 3+ product user experience to identify why customers are abandoning the bank.
*/
-- Identify high balance customer (Balances > $150k) who are currently inactive to prevent the loss of high-yield accounts

WITH balance_bin AS
	(SELECT customer_id,
	 CASE
	   WHEN balance <= 50000	THEN '<50K'
	   WHEN balance <= 100000	THEN '50k-100k'
	   WHEN balance <= 150000	THEN '100k-150k'
	   WHEN balance >  150000	THEN '>150k'
	   ELSE 'other' END AS balance_tier
	 FROM Customer_Churn)
	   
	
SELECT b.balance_tier,
	   COUNT(CASE WHEN c.active_member = 0 THEN 1 END) AS inactive_account,
	   ROUND(CAST(SUM(c.churn) AS FLOAT)*100/COUNT(*),2) AS churn_rate,
	   ROUND(CAST(SUM(c.active_member)*100 AS FLOAT)/COUNT(*),2) AS engagement_rate
FROM balance_bin b
JOIN Customer_Churn c
ON b.customer_id = c.customer_id
GROUP BY b.balance_tier
ORDER BY 
  CASE 
    WHEN b.balance_tier = '<50K' THEN 1
    WHEN b.balance_tier = '50k-100k' THEN 2
    WHEN b.balance_tier = '100k-150k' THEN 3
    WHEN b.balance_tier = '>150k' THEN 4
    ELSE 5
  END;

/* ===============================================================================
FINDINGS
===============================================================================
1. Customers with balances between 100k–150k have the highest churn rate (25.7%) and the highest number of inactive accounts. 
2. Customers with balances above 150k exhibit the second highest churn rate (23.1%), 
indicating that high-value customers are disproportionately at risk, potentially leading to significant revenue loss.


Strategic recommendations:
1. Prioritize retention strategies for high-balance customers (100k+), as they represent significant financial value but show elevated churn risk.
2. Implement proactive engagement initiatives (e.g., personalized offers, financial advisory services, loyalty programs) to reduce inactivity and strengthen customer relationships.
3. Investigate potential drivers of churn in high-balance segments (e.g., service dissatisfaction, better competitor offerings) to address root causes. 
*/

-- Estimate total balance lost due to churn
SELECT 
    ROUND(SUM(CASE WHEN churn = 1 THEN balance ELSE 0 END), 2) AS total_balance_lost,
    ROUND(SUM(balance), 2) AS total_bank_balance,
    ROUND(SUM(CASE WHEN churn = 1 THEN balance ELSE 0 END) / SUM(balance) * 100, 2) AS pct_balance_lost
FROM Customer_Churn;
/* ===============================================================================
BUSINESS IMPACT
===============================================================================
Total balance lost due to churn is approximately $185.6M, indicating substantial 
revenue leakage driven by customer attrition, particularly among high-value segments.
===============================================================================
*/

/* ===============================================================================
CONCLUSION
===============================================================================
Churn is primarily driven by high-value customers, product friction (3+ products), 
and regional disparities (Quebec), highlighting the need for targeted retention 
strategies and improved customer engagement.
===============================================================================
*/