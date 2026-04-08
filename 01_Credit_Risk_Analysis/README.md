# Credit Risk & Loan Performance Intelligence (Canada Region)
**Business Intelligence Solution for Portfolio Risk Management & Underwriting Automation**

## 📌 Executive Summary
This project delivers an end-to-end BI solution designed for a **Credit Risk Department** to monitor portfolio health and identify risk concentration. By implementing regional data governance for Canadian borrowers and building a robust Power BI data model, I identified high-risk segments representing an **89% default propensity**, leading to a strategic recommendation that could save **~750 underwriting hours annually**.

---

## 🎯 Business Objectives
* **Risk Segmentation:** Identify which borrower attributes contribute disproportionately to defaults.
* **Operational Efficiency:** Optimize the underwriting funnel by identifying "Straight-Through Processing" (STP) candidates.
* **PCL Reduction:** Provide data-driven evidence to tighten policy on high-loss cohorts.

---

## 🛠️ Technical Stack
* **Data Processing:** SQL (Data Cleaning, Validation, CTEs)
* **Data Modeling:** Power BI (Star Schema, Power Query/M)
* **Analytics:** DAX (Time Intelligence, Probability of Default)
* **Automation Logic:** Power Automate (Conceptual workflow for data alerts)

---

## 🏗️ Methodology

### 1. Data Engineering & Governance (SQL)
To ensure the model was "Bank-Ready," I implemented rigorous Data Quality (DQ) checks:
* **Audit Logic:** Developed scripts to flag logical inconsistencies, such as cases where **Loan-to-Income (LTI)** exceeded **Debt-to-Income (DTI)**.
* **Performance Scoping:** Modularized SQL views to focus on the Canada region, ensuring the architecture is scalable for multi-million row datasets.
* **Outlier Handling:** Automated the removal of "noise" data (e.g., zero-income entries or DTIs > 100%) that would skew weighted average risk grades.

### 2. Data Modeling (Power BI)
I utilized a **Star Schema** architecture to ensure high performance and intuitive filtering.
* **Fact Table:** `Fact_Loans` (Transactional data, loan amounts, status).
* **Dimension Tables:** `Dim_Borrowers` (Demographics), `Dim_Date`, and `Dim_Geography`.

---

## 📈 Key Insights & Strategic Impact

### High-Loss Propensity Discovery
Through multi-factor analysis, I identified a "Critical Risk" segment:
* **Criteria:** Income < $35k, 0-year employment tenure, Renter status.
* **Outcome:** This cohort demonstrated an **89% default rate**.
* **Action:** Recommended **Automated Decline rules** for this specific intersection, reducing Provision for Credit Losses (PCL).

### Lending Strategy Matrix
| Borrower Segment | Default Rate | Recommended Treatment | Business Rationale |
| :--- | :--- | :--- | :--- |
| **Homeowners** | ~1% | **Auto-Approval (STP)** | High stability; low volatility. |
| **Standard Renters** | 12% – 25% | **Manual Review** | Moderate risk; requires judgment. |
| **High-Risk Cohort** | ~89% | **Policy-Driven Decline** | Disproportionate loss contribution. |

---

## 💡 Strategic Recommendations
1.  **Growth Strategy:** Increase marketing spend toward the **Homeowner** segment to balance the risk of higher-yield assets.
2.  **Policy Calibration:** Tighten eligibility for Grade G loans which showed near-total loss propensity in the sample data.
3.  **Process Automation:** Shift low-risk applications to automated approval to reallocate senior underwriters to focus on complex, borderline cases.
---

## 📂 Project Files
* * **PowerBI_Files:** [📥 Download CreditRisk.pbix](./CreditRisk.pbix) file including UI/UX design from Canva.
* * **Interactive View:**
  * 📊 Project Dashboard Gallery

### **1. Executive Overview**
*Comprehensive view of Credit Risk portfolio showing Default Rate.*
![Credit Risk Overview](./Credit%20Risk%20Overview.png)

### **2. Loan Portfolio Deep-Dive**
*Detailed breakdown of loan grades and repayment performance.*
![Loan Portfolio](./Loan%20Portfolio.png)

### **3. High-Risk Segment Analysis**
*The specific segment identifying the 89% default rate is discussed in the findings.*
![Borrower Analysis](./Borrower%20with%2089%25%20Default%20rate.png)
