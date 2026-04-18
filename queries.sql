-- Query 1: Overall Attrition Rate
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees;

-- Query 2: Attrition by Department
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- Query 3: Attrition by OverTime
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY OverTime;

-- Query 4: Attrition by Salary Band
SELECT 
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium Salary'
        WHEN MonthlyIncome > 6000 THEN 'High Salary'
    END AS Salary_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY Salary_Band
ORDER BY Attrition_Rate DESC;

-- Query 5: Attrition by Job Role
SELECT 
    JobRole,
    ROUND(AVG(Age), 1) AS Avg_Age,
    ROUND(AVG(YearsAtCompany), 1) AS Avg_Years_At_Company,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income,
    COUNT(*) AS Total_Left
FROM employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY Total_Left DESC;

-- Query 6: Attrition by Age Group
SELECT 
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

-- Query 7: Attrition by Gender
SELECT 
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY Gender
ORDER BY Attrition_Rate DESC;

-- Query 8: Attrition by Marital Status
SELECT 
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;

-- Query 9: Attrition by Job Satisfaction
SELECT 
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction ASC;

-- Query 10: Attrition by Years at Company
SELECT 
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
    * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employees
GROUP BY Tenure_Group
ORDER BY Attrition_Rate DESC;
