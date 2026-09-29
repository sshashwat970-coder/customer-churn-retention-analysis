 Customer Churn & Retention Analysis

## 1. Project Overview

This project analyzes customer churn in a telecommunications dataset to understand customer retention, churn patterns, service usage, contract types, tenure, and customer charges.

The project uses **MySQL and SQL** for data analysis and **Power BI** for interactive visualization and dashboard development.

## 2. Objectives

- Calculate the overall customer churn rate
- Analyze churn across different contract types
- Understand the relationship between customer tenure and churn
- Compare churn across internet service types
- Analyze churn among senior and non-senior customers
- Examine the relationship between monthly charges and churn
- Analyze services associated with customer churn
- Identify common reasons for customer churn
- Compare characteristics of churned and retained customers
- Build an interactive Power BI dashboard

## 3. Tools and Technologies

- MySQL
- SQL
- Microsoft Excel
- Power BI
- DAX
- Data Cleaning
- Exploratory Data Analysis
- Data Visualization
- Business Analysis

## 4. Dataset

The project uses a telecommunications customer churn dataset containing **7,043 customer records** and 33 columns.

The dataset includes information related to:

- Customer demographics
- Customer tenure
- Phone and internet services
- Online security and support services
- Contract type
- Payment method
- Monthly charges
- Total charges
- Customer churn
- Churn score
- Customer lifetime value
- Churn reasons

The original dataset was retained for the Power BI analysis.

## 5. Data Preparation

The dataset was explored and prepared before analysis.

The SQL analysis focused on relevant customer, service, contract, financial, and churn-related fields.

The following checks were performed:

1. Total customer count
2. Duplicate customer ID check
3. Churn status validation
4. Missing-value checks for important fields
5. Validation of customer and financial fields

## 6. SQL Analysis

MySQL was used to perform the main analytical queries.

The analysis included:

1. Overall Churn Analysis
2. Demographic Analysis
3. Contract and Tenure Analysis
4. Financial Analysis
5. Service Analysis
6. Churn Reason Analysis
7. Churned vs Retained Customer Profile

SQL concepts used in the project include:

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- CASE
- Aggregate Functions
- COUNT()
- SUM()
- AVG()
- HAVING
- Subqueries

## 7. Key Analysis

The analysis identified differences in churn across several customer characteristics.

### Overall Churn

The dataset contains:

- Total Customers: 7,043
- Churned Customers: 1,869
- Overall Churn Rate: approximately 26.5%

### Contract Type

Churn varies significantly across contract types, with month-to-month customers showing a substantially higher churn rate than customers on longer-term contracts.

### Customer Tenure

Customers with shorter tenure show higher churn rates, while customers with longer tenure generally show lower churn rates.

### Internet Service

Churn differs across internet service types, with fiber optic customers showing a higher churn rate than DSL and customers without internet service.

### Customer Services

The analysis also examined services such as:

- Online Security
- Tech Support

Customers without these services showed higher churn rates in the analysis.

## 8. Power BI Dashboard

The final dashboard provides an interactive overview of customer churn.

### KPIs

- Total Customers
- Churned Customers
- Churn Rate
- Average Monthly Charges

### Visualizations

- Customer Churn Distribution
- Churn Rate by Contract Type
- Churn by Internet Service
- Churn Rate by Customer Tenure

### Filters

- Contract
- Senior Citizen
- Internet Service

## 9. SQL to Dashboard Workflow

The project follows this workflow:

Customer Churn Dataset
        ↓
MySQL
        ↓
SQL Data Analysis
        ↓
Business Findings
        ↓
Power BI
        ↓
Interactive Dashboard

10. Limitations
The dataset is historical and does not represent real-time customer activity.
The analysis is descriptive and exploratory.
No predictive churn model was developed.
The analysis identifies associations between customer characteristics and churn but does not establish causation.

11. Future Improvements
Possible future improvements include:

Building a customer churn prediction model
Creating customer risk segments
Adding more detailed service-level analysis
Automating data refresh
Adding additional customer retention metrics

12. About

This project was created as part of my Data Analytics portfolio to practice SQL, MySQL, Power BI, DAX, data analysis, data visualization, and business analysis.