#  Bank Customer Churn Prediction

This project simulates a **retail banking churn analysis** aimed at identifying factors that influence customer attrition and developing machine learning models to predict churn. The goal is to support proactive **customer retention strategies** for banks.

---

## Project Summary

- **Dataset**: Bank Customer Churn Prediction (10,000 records)
- **Tools**: Python, Pandas, Seaborn, Scikit-learn, XGBoost, CatBoost, LightGBM
- **Objective**: Predict whether a customer will churn based on demographic and account-related features.

---

##  Workflow

### 1. Data Cleaning & Preprocessing
- Renamed columns for consistency and readability.
- One-hot encoded `Country` and `Gender`, then transformed them into numerical values:
  - `Country_Encoded`: France=0, Germany=1, Spain=2
  - `Gender_Encoded`: Female=0, Male=1
- Saved a clean version of the dataset.

### 2. Exploratory Data Analysis (EDA)
- Checked for nulls, data types, and class imbalance.
- Visualizations:
  - **Heatmap**: Feature correlation
  - **Countplot**: Churn distribution
  - **Boxplot**: Churn by Age
- Noted class imbalance: 20.3% churned vs. 79.7% retained.

### 3. Machine Learning Models

| Model               | Accuracy | F1-Score (Churn) | Notes                                  |
|--------------------|----------|------------------|----------------------------------------|
| Logistic Regression| 82%      | 0.28             | Poor churn prediction due to imbalance |
| Random Forest       | 87%      | 0.57             | Class weights improved recall          |
| XGBoost             | 83%      | 0.60             | Tuned with `scale_pos_weight`         |
| CatBoost            | 84%      | 0.62             | Best overall performance               |


> **Best Model:** CatBoost Classifier (after threshold tuning)

### 4. Threshold Tuning (CatBoost)

| Threshold | Precision | Recall | F1-score |
|-----------|-----------|--------|----------|
| 0.10      | 0.232     | 0.987  | 0.376    |
| 0.30      | 0.350     | 0.893  | 0.503    |
| 0.50      | 0.526     | 0.786  | 0.631    |
| **0.55**  | **0.57**  | **0.75**| **0.65** |

Choose **threshold = 0.55** to balance business needs between precision and recall.

---

## Business Insights

- Customers **aged 55–90** with **high balances** but **low activity** are at higher churn risk.
- **Age** and **Active Member** status are stronger churn predictors than balance.
- Models with class weights and threshold tuning significantly improve churn capture.

---

## Files Included

- `Churn Customer Banking.ipynb` – Full Jupyter Notebook
- `Clean Bank Customer Churn Prediction.csv` – Cleaned dataset

---

## Skills Demonstrated

- Data Preprocessing & Feature Engineering
- Exploratory Data Analysis (EDA)
- Imbalanced Classification Handling
- Model Evaluation (Precision, Recall, F1-score)
- Threshold Optimization
- Application in Banking Customer Retention

---

## Future Improvements

- Add behavioral data (e.g., transaction frequency).
- Use SHAP or LIME for explainability.
- Explore model stacking/ensembling.

---

*This project is part of a Data Analytics & Business Intelligence portfolio focused on solving real-world business problems using machine learning.*


# Metropolitan Transportation Authority (MTA) Train Delay Analysis Dashboard

**Capstone Project – BIA 5450: Business Insights and Analytics**  

---

## Project Overview

This project addresses persistent train delays within the Metropolitan Transportation Authority (MTA), with a focus on the Long Island Railroad (LIRR) and Metro-North Railroad. By analyzing five years of publicly available data (2020–2024), an interactive Power BI dashboard was developed to support operational decision-making, reduce delays, and enhance the commuter experience.

---

## Objectives

- Identify trends, causes, and severity of train delays across lines, stations, and periods.
- Equip the MTA with actionable insights to improve scheduling and resource deployment.
- Deliver a scalable dashboard solution for both historical analysis and operational monitoring.

---

## Tools and Technologies

- Power BI – Data visualization and dashboard development
- Power Query – Data extraction, cleaning, and transformation
- DAX (Data Analysis Expressions) – Calculated columns and KPIs
- Star Schema Design – Data modeling for performance and scalability
- OneDrive – Cloud-based storage and collaboration

---

## Methodology

### Data Preparation
- Collected datasets from the New York State Open Data Portal.
- Cleaned and standardized records, handled missing values, removed duplicates.
- Created new variables including day type, seasonal classification, and delay severity levels.

### Data Modeling
- Constructed a star schema with one fact table and ten dimension tables.
- Defined calculated measures and columns to support trend and performance analysis.

### Dashboard Development
- Developed a multi-page Power BI dashboard, including:
  - Overview Report
  - Historical Trends
  - Calendar-Based Analysis
  - Operational Metrics
  - Delay Category Analysis

### Testing and Optimization
- Validated metric accuracy against raw data and Excel calculations.
- Improved responsiveness through column pruning, DAX optimization, and incremental data refresh.
- Enhanced user experience with interactive visuals, filters, and navigational flow.

---

## Key Outcomes

- Delivered a fully interactive Power BI dashboard covering MTA commuter delay data from 2020 to 2024.
- Identified high-delay lines, peak disruption times, and major contributing factors.
- Enabled data-driven insights for operational efficiency and improved commuter service.

---

## Future Enhancements

- Integration with real-time APIs for live delay tracking.
- Implementation of smart alerts and automated notifications.
- Role-based access for customized views per department.
- Mobile-responsive layout for field use.

---
### Operational Report

This report focuses on operational insights by station, line, and delay category. It highlights the most delayed stations and branches, along with monthly delay trends.

![Operational Report](operational_report.png)

---

### Historical Report

This report presents long-term trends in delay volume and severity from 2020 to 2024, including year-over-year and month-over-month comparisons.

![Historical Report](historical_report.png)

