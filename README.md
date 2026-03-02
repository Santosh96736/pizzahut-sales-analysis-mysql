# 🍕 PizzaHut Sales Analysis Using MySQL

Structured and performance-optimized sales analysis of a simulated transactional dataset representing pizza restaurant operations, implemented using MySQL.


## Table of Contents

* [Project Overview](#project-overview)

* [Business Objectives](#business-objectives)

* [Dataset](#dataset)

* [Database Design & Normalization](#database-design--normalization)

* [Indexing & Performance Strategy](#indexing--performance-strategy)

* [Data Ingestion](#data-ingestion)

* [Analytical Queries](#analytical-queries)

* [Key Insights](#key-insights)

* [Skills Demonstrated](#skills-demonstrated)

* [Contact](#contact)
    

## Project Overview

This project analyzes a simulated transactional sales dataset representing one year of operations for a pizza restaurant.

The objective was to design a structured relational database and perform analytical SQL while applying performance optimization techniques.

Unlike a basic SQL practice project, this version emphasizes:

* Schema normalization

* Constraint enforcement

* Workload-driven indexing

* Execution plan validation using EXPLAIN

* Structured data ingestion using Python
  

## Business Objectives

This analysis aims to answer the following:

* Which pizzas generate the highest revenue?

* Which pizza size has the highest demand?

* Which category contributes most to overall revenue?

* What are peak sales hours and peak weekdays?

* How does revenue change month-over-month?

* Does a small subset of pizzas contribute most of the revenue (Pareto principle)?
  

## Dataset

Source: Publicly available pizza sales dataset on  
[Kaggle - Pizza Place Sales](https://www.kaggle.com/datasets/mysarahmadbhat/pizza-place-sales)

Note: The raw CSV files are not included in this repository.  
Please download them directly from Kaggle before running the ETL notebook.

Scope: One year of transactional sales data.

### Tables
### orders

* order_id – Unique identifier for each order

* date – Order date

* time – Order time

In the optimized schema, date and time were merged into a single order_datetime column for improved filtering and indexing efficiency.

### order_details

* order_details_id – Unique row identifier

* order_id – Foreign key referencing orders

* pizza_id – Foreign key referencing pizzas

* quantity – Quantity ordered

### pizzas

* pizza_id – Unique identifier (type + size combination)

* pizza_type_id – Foreign key referencing pizza_types

* size – S, M, L, XL, XXL

* price – Price in USD

### pizza_types

* pizza_type_id – Unique identifier

* name – Pizza name

* category – Classic, Chicken, Supreme, Veggie

* ingredients – Comma-delimited ingredient list

Note: Ingredients are stored as a delimited string for simplicity.  
This could be further normalized into a separate ingredient table if ingredient-level analysis were required.


## Database Design & Normalization

The schema was designed using relational modeling principles.

### Key Improvements

* Implemented PRIMARY KEY and FOREIGN KEY constraints

* Added CHECK constraints for positive price and quantity

* Replaced separate date and time columns with order_datetime

* Used consistent constraint naming conventions

* Avoided redundant indexing
  
Schema file available in: [Schema](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/schema/pizzahut_schema.sql)


## Indexing & Performance Strategy

Indexes were created based on cardinality and selectivity analysis rather than blindly indexing all columns.

### Implemented Indexes

* idx_orders_order_datetime

* idx_pizza_types_category

### Performance Validation

Used EXPLAIN to verify:

* Range scans for date filtering

* Indexed joins through foreign keys

* Appropriate full table scans for aggregations

* Sorting behavior in window functions

This ensures indexing is applied only where it meaningfully improves query performance.


## Data Ingestion

Data was loaded into MySQL using a Jupyter Notebook.

### Tools Used

* Pandas

* SQLAlchemy

* mysql-connector

### Steps Performed

* Read CSV files

* Checked for null values and duplicates

* Inspected data types

* Inserted into predefined MySQL schema

* Used to_sql(method='multi') for batch insertion

Note: Minimal transformation was applied. Data integrity is enforced at the database level using constraints.

Notebook available in: [Ingestion](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/etl/PizzaHut_Python_codes.ipynb)


## Analytical Queries
### Basic KPIs

* Total Revenue

* Total Quantity Sold

* Average Quantity per Order

* Average Order Value

### Product Performance

* Highest revenue-generating pizza

* Size demand distribution

* Category contribution percentage

* Price vs quantity relationship

### Time-Based Analysis

* Peak sales hour

* Peak weekday

* Monthly revenue trend

* Month-over-month growth using LAG

### Advanced Analysis

* Pareto analysis (80/20 rule)

* Revenue cumulative trend (window functions)

* Order clustering by time of day

* Size preference by category (Window functions)

All queries are available in:
- [KPI](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/queries/kpi_queries.sql)
- [Product Performance](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/queries/product_performance_queries.sql)
- [Time Based](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/queries/time_based_patterns_queries.sql)
- [Advanced](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/queries/advance_patterns_queries.sql)
- [Performance Validation](https://github.com/Santosh96736/pizzahut_sales_analysis_mysql/blob/main/queries/performance_validation_query.sql)


## Key Insights
* Peak sales occur at 12 PM, indicating strong lunch demand.
* Friday generates the highest weekly revenue.
* Revenue fluctuates month-over-month with seasonal variation.
* Classic category contributes the highest volume (30%).
* Thai Chicken Pizza generates the highest total revenue.
* Revenue follows the Pareto principle.


## Skills Demonstrated
* Relational database design

* Schema normalization

* Constraint implementation

* Workload-driven indexing

* Execution plan analysis using EXPLAIN

* Analytical SQL (CTEs, window functions, aggregations)

* Data ingestion using Python

* Business insight extraction


 ## Contact

If you would like to discuss this project or explore collaboration opportunities, feel free to reach out.
 
Email : santosh96736@gmail.com  
LinkedIn : [www.linkedin.com/in/santosh96736-data-analyst](https://www.linkedin.com/in/santosh96736-data-analyst/)  
GitHub : https://github.com/Santosh96736/pizzahut_sales_analysis_mysql

