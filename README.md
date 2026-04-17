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


---

