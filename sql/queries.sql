-- Monthly profit evolution
SELECT TO_CHAR("Order Date", 'YYYY-MM') AS "Year_Month",
      SUM("Profit") AS "Total_Profit"
FROM "Superstore"
GROUP BY "Year_Month"
ORDER BY "Year_Month";

-- Monthly growth_percentage
WITH "Monthly_Sales" AS 
    (SELECT
    EXTRACT(YEAR FROM "Order Date") AS YEAR,
    EXTRACT(MONTH FROM "Order Date") AS MONTH,
    SUM("Profit") as "Total_profit"
    FROM "Superstore"
    GROUP BY YEAR,MONTH
    ORDER BY YEAR, MONTH)

    SELECT*,
    LAG("Total_profit") OVER (ORDER BY MONTH) AS "Previous_profit",
    (("Total_profit" - LAG("Total_profit") OVER (ORDER BY MONTH))/
    LAG("Total_profit") OVER (ORDER BY MONTH))*100 AS "Growth_percentage"
    FROM "Monthly_Sales";

-- Top 5 High Profits Products
SELECT "Product Name",
      SUM("Profit") AS "Total_Profit"
FROM "Superstore"
GROUP BY "Product Name"
ORDER BY SUM("Profit") DESC
LIMIT 5;

-- Top 5 Low Profits Products
SELECT "Product Name",
      SUM("Profit") AS "Total_Profit"
FROM "Superstore"
GROUP BY "Product Name"
ORDER BY SUM("Profit") DESC
LIMIT 5;


-- Top Performing States and Cities
SELECT "Region",
        "City",
        SUM("Profit") AS "Total_Profit"
FROM "Superstore"
GROUP BY "Region",
          "City"
ORDER BY SUM("Profit") DESC
LIMIT 5;

-- Underperforming States and Cities
SELECT "Region",
        "City",
        SUM("Profit") AS "Total_Profit"
FROM "Superstore"
GROUP BY "Region",
          "City"
ORDER BY SUM("Profit") ASC
LIMIT 5;

-- Most Profitable Customers
SELECT "Customer Name",
        SUM("Profit") AS "Total_Profit"
FROM "Superstore"
GROUP BY "Customer Name"
ORDER BY SUM("Profit") DESC
LIMIT 5;

-- Segmentation
SELECT "Customer Name",
        SUM("Profit") AS "Total_Profit",
        CASE WHEN SUM("Profit") > 2000 THEN 'VIP'
            WHEN SUM  ("Profit") > 1000 THEN 'Premium'
            ELSE 'Standard'
        END AS "Category_Customers"
FROM "Superstore"
GROUP BY "Customer Name";
