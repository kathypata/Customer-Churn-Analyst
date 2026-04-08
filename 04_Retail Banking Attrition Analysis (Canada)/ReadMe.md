# 🏦 Retail Banking Attrition Analysis (Canada)

**Author:** Katherine Patadee (Pew)  
**Date:** March 30, 2026  
**Project Type:** SQL-Based Data Analysis | Customer Churn | Business Intelligence  

---

## 📌 Overview
This project analyzes customer attrition (churn) in a Canadian retail banking dataset. The goal is to identify key drivers of churn, quantify financial impact, and provide actionable business recommendations to improve customer retention.

---

## 🚨 Executive Summary
- 📊 **Overall churn rate:** **20.37%** (above 15% industry benchmark)  
- 📍 **Highest-risk region:** Quebec (**32.44% churn**)  
- 🧩 **Product friction:** Customers with **3+ products → 82%–100% churn**  
- 💰 **High-value risk:** Customers with **$100K+ balances** show elevated churn  
- 💸 **Estimated loss:** **$185.6M (~24% of total deposits)**  

👉 **Key Insight:**  
Churn is heavily concentrated among **high-value customers**, making this not just a retention issue—but a **major revenue leakage problem**.

---

## 🎯 Business Problems & Objectives

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

## 🗂️ Dataset Overview

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

## 🔍 Analysis & Key Findings

### 1. Overall Churn Rate
```sql
SELECT 
    SUM(churn) AS total_churned,
    COUNT(*) AS total_customers,
    CAST(SUM(churn) AS FLOAT)*100/COUNT(*) AS churn_rate
FROM Customer_Churn;
