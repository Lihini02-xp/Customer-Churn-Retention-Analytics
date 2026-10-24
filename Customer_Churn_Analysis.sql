USE customer_churn_db;

-- 1. Overall Customer Churn Analysis
SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn = 'Yes') AS Churned_Customers,
    SUM(Churn = 'No') AS Retained_Customers,
    ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM `Telco-Customer-Churn`;


-- 2. Contract Type Analysis
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(Churn = 'Yes') AS Churned_Customers,
    ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM `Telco-Customer-Churn`
GROUP BY Contract
ORDER BY Churn_Rate_Percent DESC;


-- 3. Payment Method Analysis
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(Churn = 'Yes') AS Churned_Customers,
    ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM `Telco-Customer-Churn`
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Percent DESC;


-- 4. Customer Tenure Analysis
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(Churn = 'Yes') AS Churned_Customers,
    ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM `Telco-Customer-Churn`
GROUP BY Tenure_Group
ORDER BY MIN(tenure);


-- 5. Internet Service Analysis
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(Churn = 'Yes') AS Churned_Customers,
    ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM `Telco-Customer-Churn`
GROUP BY InternetService
ORDER BY Churn_Rate_Percent DESC;