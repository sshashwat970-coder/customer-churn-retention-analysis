-- Rename columns
ALTER TABLE customer_churn
RENAME COLUMN `ï»¿CustomerID` TO customer_id,
RENAME COLUMN `Gender` TO gender,
RENAME COLUMN `Senior Citizen` TO senior_citizen,
RENAME COLUMN `Partner` TO partner,
RENAME COLUMN `Dependents` TO dependents,
RENAME COLUMN `Tenure Months` TO tenure_months,
RENAME COLUMN `Phone Service` TO phone_service,
RENAME COLUMN `Multiple Lines` TO multiple_lines,
RENAME COLUMN `Internet Service` TO internet_service,
RENAME COLUMN `Online Security` TO online_security,
RENAME COLUMN `Online Backup` TO online_backup,
RENAME COLUMN `Device Protection` TO device_protection,
RENAME COLUMN `Tech Support` TO tech_support,
RENAME COLUMN `Streaming TV` TO streaming_tv,
RENAME COLUMN `Streaming Movies` TO streaming_movies,
RENAME COLUMN `Contract` TO contract,
RENAME COLUMN `Paperless Billing` TO paperless_billing,
RENAME COLUMN `Payment Method` TO payment_method,
RENAME COLUMN `Monthly Charges` TO monthly_charges,
RENAME COLUMN `Total Charges` TO total_charges,
RENAME COLUMN `Churn Label` TO churn_label,
RENAME COLUMN `Churn Value` TO churn_value,
RENAME COLUMN `Churn Score` TO churn_score,
RENAME COLUMN `CLTV` TO cltv,
RENAME COLUMN `Churn Reason` TO churn_reason;

-- Check for duplicate entries

SELECT customer_id, COUNT(*) AS count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check for missing values

SELECT
    COUNT(*) AS total_rows,
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(gender IS NULL) AS missing_gender,
    SUM(tenure_months IS NULL) AS missing_tenure,
    SUM(monthly_charges IS NULL) AS missing_monthly_charges,
    SUM(total_charges IS NULL) AS missing_total_charges,
    SUM(churn_label IS NULL) AS missing_churn_label,
    SUM(churn_value IS NULL) AS missing_churn_value,
    SUM(contract IS NULL) AS missing_contract,
    SUM(payment_method IS NULL) AS missing_payment_method
FROM customer_churn;

-- Total churned and retained customers
SELECT
    churn_label,
    COUNT(*) AS customer_count
FROM customer_churn
GROUP BY churn_label
ORDER BY customer_count DESC;

-- Overall churn rate
SELECT COUNT(*) AS Total_customers,
       SUM(churn_value) AS Total_churned_customers,
       ROUND(SUM(churn_value)/COUNT(*)*100,2) AS churn_rate
FROM customer_churn;

-- 1. DEMOGRAPHIC ANALYSIS
-- Churn by Senior Citizen status
SELECT
    senior_citizen,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY senior_citizen
ORDER BY churn_rate DESC;

-- Churn by Partner status
SELECT
    partner,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY partner
ORDER BY churn_rate DESC;

-- 2. CONTRACT & TENURE ANALYSIS
-- Churn by Contract type
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate DESC;

-- Churn by Tenure group
SELECT
    CASE
        WHEN tenure_months <= 12 THEN '0-12 Months'
        WHEN tenure_months <= 24 THEN '13-24 Months'
        WHEN tenure_months <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- 3. FINANCIAL ANALYSIS
-- Churn by Monthly Charges
SELECT
    CASE
        WHEN monthly_charges < 40 THEN 'Under $40'
        WHEN monthly_charges < 70 THEN '$40-$69'
        WHEN monthly_charges < 100 THEN '$70-$99'
        ELSE '$100+'
    END AS monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY monthly_charge_group
ORDER BY churn_rate DESC;

-- 4. SERVICE ANALYSIS
-- Churn by Internet Service
SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY internet_service
ORDER BY churn_rate DESC;

-- Churn by Online Security
SELECT
    online_security,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY online_security
ORDER BY churn_rate DESC;

-- Churn by Tech Support
SELECT
    tech_support,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND(
        SUM(churn_value) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY tech_support
ORDER BY churn_rate DESC;

-- 5. CHURN REASON ANALYSIS
-- Reasons for customer churn

SELECT
    churn_reason,
    COUNT(*) AS churned_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM customer_churn
            WHERE churn_value = 1
        ),
        2
    ) AS percentage_of_churned
FROM customer_churn
WHERE churn_value = 1
GROUP BY churn_reason
ORDER BY churned_customers DESC;

-- 6. CHURNED VS RETAINED CUSTOMER PROFILE
-- Compare average customer characteristics between churned and retained customers

SELECT
    churn_label,
    COUNT(*) AS customer_count,
    ROUND(AVG(tenure_months), 2) AS avg_tenure,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges,
    ROUND(AVG(total_charges), 2) AS avg_total_charges,
    ROUND(AVG(cltv), 2) AS avg_cltv
FROM customer_churn
GROUP BY churn_label;

DESCRIBE customer_churn;