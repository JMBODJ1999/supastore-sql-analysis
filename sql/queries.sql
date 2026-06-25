-- Monthly profit evolution
SELECT TO_CHAR("OrderDate", 'YYYY-MM') AS "Year_Month",
      SUM("Profit") AS "Total_Profit"
FROM "Supastore"
GROUP BY "Year_Month"
ORDER BY "Year_Month";



-- Top 5 High Profits Products
SELECT "Product Name",
      SUM("Profit") AS "Total_Profit"
FROM "Supastore"
GROUP BY "Product Name"
ORDER BY SUM("Profit") DESC
LIMIT 5;

-- Top 5 Low Profits Products
SELECT "Product Name",
      SUM("Profit") AS "Total_Profit"
FROM "Supastore"
GROUP BY "Product Name"
ORDER BY SUM("Profit") DESC
LIMIT 5;


-- Top Performing States and Cities
SELECT "Region",
        "City",
        SUM("Profit") AS "Total_Profit"
FROM "Supastore"
GROUP BY "Region",
          "City"
ORDER BY SUM("Profit") DESC
LIMIT 5;

-- Underperforming States and Cities
SELECT "Region",
        "City",
        SUM("Profit") AS "Total_Profit"
FROM "Supastore"
GROUP BY "Region",
          "City"
ORDER BY SUM("Profit") ASC
LIMIT 5;
