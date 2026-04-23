SELECT COUNT(*) AS total_rows
FROM ecommerce_transactions;

-- 1. TOTAL REVENUE --

SELECT ROUND(SUM(Purchase_Amount), 2) AS total_revenue
FROM ecommerce_transactions;

-- 2. REVENUE BY COUNTRY -- 

SELECT Country,
       ROUND(SUM(Purchase_Amount), 2) AS revenue
FROM ecommerce_transactions
GROUP BY Country
ORDER BY revenue DESC;

-- 3. TOP PRODUCT CATEGORY --

SELECT Product_Category,
       COUNT(*) AS total_orders,
       ROUND(SUM(Purchase_Amount), 2) AS revenue
FROM ecommerce_transactions
GROUP BY Product_Category
ORDER BY revenue DESC
LIMIT 5;

-- 4. PAYMENT METHOD ANALYSIS -- 

SELECT Payment_Method,
       COUNT(*) AS total_orders,
       ROUND(SUM(Purchase_Amount), 2) AS revenue
FROM ecommerce_transactions
GROUP BY Payment_Method
ORDER BY revenue DESC;

-- 5. MONTHLY SALES TREND --

SELECT strftime('%Y-%m', Transaction_Date) AS month,
       ROUND(SUM(Purchase_Amount), 2) AS revenue
FROM ecommerce_transactions
GROUP BY month
ORDER BY month;

-- 6. TOP CUSTOMERS --

SELECT User_Name,
       ROUND(SUM(Purchase_Amount), 2) AS total_spent
FROM ecommerce_transactions
GROUP BY User_Name
ORDER BY total_spent DESC
LIMIT 10;

-- CUSTOMER SEGMENTATION --

SELECT 
  CASE 
    WHEN Purchase_Amount >= 800 THEN 'High Value'
    WHEN Purchase_Amount >= 400 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS customer_type,
  COUNT(*) AS total_orders
FROM ecommerce_transactions
GROUP BY customer_type;