#  Retail Banking Attrition Analysis (Canada)

**Author:** Katherine Patadee  
**Date:** March 30, 2026  
**Project Type:** SQL-Based Data Analysis | Customer Churn | Business Intelligence  

---

##  Overview
This project analyzes customer attrition (churn) in a Canadian retail banking dataset. The goal is to identify key drivers of churn, quantify financial impact, and provide actionable business recommendations to improve customer retention.

---

##  Executive Summary
-  **Overall churn rate:** **20.37%** (above 15% industry benchmark)  
-  **Highest-risk region:** Quebec (**32.44% churn**)  
-  **Product friction:** Customers with **3+ products → 82%–100% churn**  
-  **High-value risk:** Customers with **$100K+ balances** show elevated churn  
-  **Estimated loss:** **$185.6M (~24% of total deposits)**  

 **Key Insight:**  
Churn is heavily concentrated among **high-value customers**, making this not just a retention issue—but a **major revenue leakage problem**.

---

##  Business Problems & Objectives

### 1. High Overall Churn
- Current churn exceeds industry benchmark (20.37% vs 15%)
- Objective: Identify root causes and reduce attrition

### 2. Regional Disparity (Quebec vs Ontario)
- Quebec churn is **2x higher** than Ontario
- Objective: Understand regional behavioral differences

### 3. Product Friction ("Over-Selling")
- Customers with 3+ products churn at extremely high rates
- Objective: Validate whether product complexity drives churn

### 4. High-Value Customer Inactivity
- High-balance customers (> $150K) are inactive but valuable
- Objective: Prevent loss of high-yield accounts

---

##  Dataset Overview

**Table:** `Customer_Churn`  
**Total Records:** 10,000 customers  

### Key Features:
| Column | Description |
|--------|------------|
| customer_id | Unique customer identifier |
| credit_score | Creditworthiness score (350–850) |
| province | Customer region (Ontario, Quebec, etc.) |
| age | Customer age |
| tenure | Years with bank |
| balance | Account balance (CAD) |
| products_number | Number of bank products |
| credit_card | Has credit card (1/0) |
| active_member | Active status (1/0) |
| estimated_salary | Annual income (CAD) |
| churn | Target variable (1 = Exited) |

---

##  Detailed Findings

---

###  1. Overall Churn Rate

**Metric:**
- Overall churn rate = **20.37%**
- Industry benchmark = **15%**

**Insight:**
- The bank’s churn rate is **~36% higher than the industry benchmark**, indicating a systemic retention issue rather than isolated cases.

**Business Impact:**
- Elevated churn reduces customer lifetime value (CLV)
- Signals inefficiencies in retention strategy and customer engagement

---

###  2. Regional Disparity (Quebec vs Ontario)

**Metrics:**
- Quebec churn rate: **32.44%**
- Ontario churn rate: **16.15%**
- Quebec avg balance: **$119K**
- Ontario avg balance: **$62K**

**Insights:**
- Quebec churn is **2x higher** than Ontario
- Quebec customers hold **significantly higher balances**, making them more valuable
- Lower engagement levels suggest customers use the bank as a **secondary/savings account**

**Business Interpretation:**
- Quebec is a **high-value but low-loyalty segment**
- Represents a **concentration of financial risk**

---

###  3. Product-Based Churn (Product Friction)

**Metrics:**
- 1 product → **27.7% churn**
- 2 products → **7.58% churn (lowest)**
- 3 products → **82.7% churn**
- 4 products → **100% churn**

**Insights:**
- Customers with **2 products are the most stable and engaged**
- Churn increases **exponentially after 3+ products**
- Engagement drops significantly for high product counts

**Business Interpretation:**
- Evidence of **“over-selling” or product complexity**
- More products ≠ more loyalty
- Likely driven by:
  - Poor user experience
  - Lack of integration between products
  - Customer overwhelm

---

###  4. High-Balance Customer Risk

**Metrics:**
- $100K–$150K → **25.7% churn (highest)**
- $150K+ → **23.1% churn**
- High inactive account concentration in these segments

**Insights:**
- High-value customers are **more likely to churn than lower-balance segments**
- Many are **inactive**, indicating weak relationship with the bank

**Business Interpretation:**
- These customers are **financially valuable but behaviorally disengaged**
- High likelihood of switching to competitors offering better value or service

---

###  5. Customer Engagement (Active vs Inactive)

**Insights:**
- Lower engagement strongly correlates with higher churn
- High-balance customers show **unexpectedly low activity levels**

**Business Interpretation:**
- Engagement is a **leading indicator of churn**
- Inactive customers represent **hidden churn risk before actual exit**

---

###  6. Financial Impact of Churn

**Metrics:**
- Total balance lost: **$185.6M**
- % of total deposits lost: **~24%**

**Insights:**
- Nearly **1/4 of total bank deposits are at risk or lost**
- Churn is concentrated among **high-value accounts**, amplifying impact

**Business Interpretation:**
- This is not just a customer issue — it is a **major revenue leakage problem**
- Small improvements in retention could yield **significant financial recovery**

---

##  Key Synthesis

Across all analyses, churn is driven by three core factors:

1. **High-Value Customers at Risk**
   - Largest balances
   - Highest financial impact

2. **Product Friction**
   - Optimal point = **2 products**
   - Sharp churn increase beyond that

3. **Regional Concentration (Quebec)**
   - High churn + high balances
   - Low engagement

 **Final Insight:**
Churn is **predictable, concentrated, and preventable** — not random.
