# Superstore Sales Analysis Project

## Overview
This project analyzes the Superstore Sales Dataset from Kaggle using SQL to explore retail sales patterns. The analysis includes 10 beginner-to-intermediate questions, covering counts, aggregations, time-based analysis, and correlations, ideal for learning SQL.

## Dataset
- **Source**: Kaggle (Superstore Sales Dataset, https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)
- **Rows**: ~9,994 (sample CSV contains 1000 rows)
- **Columns**:
  - Row_ID: Unique row identifier
  - Order_ID: Order identifier
  - Order_Date: Date of order
  - Ship_Date: Date of shipment
  - Ship_Mode: Shipping method
  - Customer_ID: Customer identifier
  - Customer_Name: Customer name
  - Segment: Customer segment (Consumer, Corporate, Home Office)
  - Country: Country of sale
  - City: City of sale
  - State: State of sale
  - Postal_Code: Postal code
  - Region: Region of sale
  - Product_ID: Product identifier
  - Category: Product category
  - Sub_Category: Product sub-category
  - Product_Name: Product description
  - Sales: Sales amount
  - Quantity: Number of items
  - Discount: Discount applied
  - Profit: Profit from sale

## Analysis Questions and Findings
1. **How many unique customers made purchases?**
   - **Answer**: 793 unique customers.

2. **What is the total profit generated from all sales?**
   - **Answer**: $286,397.02.

3. **What is the average sales amount per order?**
   - **Answer**: $614.55.

4. **Which region has the highest total sales?**
   - **Answer**: West region: $725,457.82.

5. **What is the most popular product sub-category by quantity sold?**
   - **Answer**: Binders: 5,971 units sold.

6. **How many orders were placed in each year?**
   - **Answer**:
     - 2014: 1,758 orders
     - 2015: 2,102 orders
     - 2016: 2,582 orders
     - 2017: 3,554 orders

7. **What is the average discount by customer segment?**
   - **Answer**:
     - Consumer: 0.16
     - Corporate: 0.15
     - Home Office: 0.15

8. **What is the total profit by month in 2017?**
   - **Answer** (sample months):
     - January: $6,664.12
     - February: $5,042.60
     - November: $18,290.70
     - December: $17,837.30

9. **Which top 5 cities have the highest profit?**
   - **Answer**:
     - New York City: $62,059.24
     - Los Angeles: $30,411.21
     - Seattle: $29,155.66
     - San Francisco: $19,575.58
     - Detroit: $16,791.08

10. **What is the correlation between sales and profit?**
    - **Answer**: 0.479 (moderate positive correlation).

## Setup Instructions
1. Create a SQL database (e.g., PostgreSQL recommended).
2. Run the table creation query from `superstore_sales_analysis.sql`.
3. Import the data from `superstore_sales.csv` using your database's import tool (e.g., `COPY` in PostgreSQL).
4. Execute the analysis queries in `superstore_sales_analysis.sql` to reproduce the results.

## Files
- `superstore_sales.csv`: Sample dataset with 1000 rows (full dataset on Kaggle).
- `superstore_sales_analysis.sql`: SQL script for table creation, cleaning, and analysis with 10 questions and answers.
- `README.md`: Project documentation with findings and instructions.

## Requirements
- SQL database system (PostgreSQL recommended for CORR and EXTRACT functions)
- Data import tool compatible with CSV
- Basic SQL knowledge to run queries

## Notes
- The full dataset (~9,994 rows) is available at https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting. The provided CSV is a 1000-row sample.
- Queries are written for PostgreSQL. For other databases (e.g., MySQL), adapt functions like CORR (use a custom formula) or EXTRACT (use MONTH()).
- Answers are based on the full dataset; sample data results may vary slightly.
- Data cleaning removes negative/zero sales and quantities to ensure valid data.

## License
The Superstore Sales Dataset is publicly available on Kaggle. The analysis code is licensed under MIT License.[](https://www.projectpro.io/article/sql-database-projects-for-data-analysis-to-practice/565)