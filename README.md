# 🛒 E-Commerce Sales Analysis — SQL Project

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=mysql)
![Database](https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![Queries](https://img.shields.io/badge/Queries-25+-purple?style=for-the-badge)

> **A comprehensive SQL-based analysis of an e-commerce dataset covering customer behavior, sales trends, profit tracking, and product performance — using advanced SQL techniques.**

---

## 📌 Project Overview

This project dives deep into an e-commerce transactional database to extract meaningful business insights. It covers everything from basic aggregations to advanced window functions, subqueries, and CTEs — simulating the kind of real-world analysis a data analyst would perform on retail sales data.

---

## 🗄️ Database Schema

The project uses three core tables:

| Table | Description |
|-------|-------------|
| `l_orders` | Customer and order location details (Customer Name, City, State, Order Date) |
| `order_d` | Order-level details (Amount, Profit, Quantity, Category, Sub-Category) |
| `sales_t` | Monthly sales targets per category |

> Tables are joined on `Order ID` to produce combined insights across customers, geographies, and products.

---

## 🔍 Business Questions Answered

The project answers **25 analytical questions** across multiple business dimensions:

### 👤 Customer Analysis
| # | Question |
|---|----------|
| 1 | List all distinct customers |
| 9 | Calculate the average order value (AOV) per customer |
| 11 | Show customers who placed more than 5 orders |
| 13 | Find customers whose names start with "S" but not from Punjab, Delhi, or Haryana |
| 24 | Find customers whose total sales exceed the average across all customers |

### 📦 Order & Sales Analysis
| # | Question |
|---|----------|
| 2 | Find the total number of orders placed |
| 3 | What is the overall average order value (AOV)? |
| 4 | Show all orders with sales above the overall average |
| 5 | What are the total sales and total profit overall? |
| 7 | What is the monthly sales trend? |

### 🌍 Geographic Analysis
| # | Question |
|---|----------|
| 6 | Which state and city generates the highest revenue? |
| 12 | Find total sales by category and city |
| 14 | Identify orders from cities containing "pur" in Electronics/Clothing (excluding certain states) |
| 15 | Cities starting with "C" where Electronics/Furniture sales exceed ₹3000 |
| 18 | Find states where total sales exceed the average state sales |
| 25 | Find the category with highest sales in each state |

### 📊 Product & Category Analysis
| # | Question |
|---|----------|
| 8 | Which category contributes the highest sales and profit? |
| 10 | Find total quantity sold per product sub-category |
| 16 | Identify loss-making products |
| 17 | Identify orders where profit is negative |
| 21 | Rank product categories by profit |
| 22 | Find the second most profitable category |
| 23 | Rank sub-categories within each category by sales |

### 🎯 Target & Performance Analysis
| # | Question |
|---|----------|
| 19 | Find categories that met or exceeded their monthly sales targets |
| 20 | Top 3 customers by total sales in each state |

---

## 🛠️ SQL Concepts & Techniques Used

```
✅ DDL          — CREATE, ALTER, DROP
✅ DML          — SELECT, UPDATE, SET
✅ Aggregations  — SUM, COUNT, AVG, ROUND
✅ Filtering     — WHERE, HAVING, LIKE, IN, NOT IN
✅ Joins         — INNER JOIN across multiple tables
✅ Subqueries    — Correlated & scalar subqueries
✅ CTEs          — WITH clause for readable logic
✅ Window Functions — RANK(), DENSE_RANK(), AVG() OVER()
✅ Date Functions — STR_TO_DATE(), DATE_FORMAT()
✅ String Functions — LIKE with pattern matching
```

## 📁 Project Structure

```
📦 e-commerce-sql-analysis/
 ┣ 📄 E-Commerce_script.sql      ← All queries (DDL + Analysis)
 ┣ 📄 E-Commerce_Analysis_(PPT)  ← Project PPT
 ┗ 📄 README.md                  ← Project documentation
```

---

## ▶️ How to Run

1. **Clone this repository**
   ```bash
   git clone https://github.com/your-username/e-commerce-sql-analysis.git
   ```

2. **Open your MySQL client** (MySQL Workbench, DBeaver, or CLI)

3. **Create and select the database**
   ```sql
   CREATE DATABASE e_commerce_db;
   USE e_commerce_db;
   ```

4. **Import your data tables** (`l_orders`, `order_d`, `sales_t`) into the database

5. **Run the script**
   ```bash
   source E-Commerce_script.sql;
   ```

6. Execute any individual query block to explore specific insights

---

## 💡 Key Insights (Sample Findings)

- 📍 Certain **states and cities** consistently generate disproportionately high revenue
- 📉 Some **sub-categories** are loss-making despite high sales volume
- 📅 **Monthly trends** reveal seasonal spikes in specific categories
- 🏆 A small group of **repeat customers** (5+ orders) drives significant revenue
- 🎯 Not all categories consistently **meet their sales targets** every month

---

## 🧰 Tools & Environment

| Tool | Purpose |
|------|---------|
| MySQL 8.x | Query execution & database management |
| MySQL Workbench | GUI for running and testing queries |
| SQL Safe Update Mode | Disabled for bulk UPDATE operations |

---

## 🙋 About the Author

Built as part of a hands-on SQL data analysis project to practice real-world business intelligence using structured query language (SQL).

---

## 👤 Author

**[Sweta Mehta]**  
Data Analyst | Data Science Portfolio Project  

----

![image alt](https://github.com/Sweta941/E-Commerce-Data-Analysis-Using-MySQL-/blob/31bf2074ee3ceed8b275cabe231753768ce41953/Screenshot%20(71).png)


![image alt](https://github.com/Sweta941/E-Commerce-Data-Analysis-Using-MySQL-/blob/80946521006d33813cabe4c0bf0e3a4eda5ac8c6/Screenshot%20(76).png)



