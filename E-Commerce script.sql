Create database e_commerce_db;

use e_commerce_db;

select *
from l_orders;

select *
from order_d;

select *
from sales_t;

alter table l_orders
add column Order_Date date;

SET SQL_SAFE_UPDATES = 0;

update l_orders
set Order_Date = str_to_date(`Order Date`, "%d-%m-%Y");

ALTER TABLE orders ADD COLUMN order_date DATE;

alter table sales_t
drop order_month;

/* 1. List all distinct customers.*/
Select distinct(CustomerName)
from l_orders;

/* 2. Find total number of orders placed.*/
select count(`Order ID`) as Total_Orders
from l_orders;

/* 3. What is the average order value (AOV)?*/
select round(sum(Amount)/count(`Order ID`),2) as AOV
from order_d;

/* 4. Show all orders with sales value greater than the overall average sales.*/
select `Order ID`, Amount
from order_d
where Amount > (select Avg(Amount)
				from order_d);

/* 5. What is the total sales and total profit overall? */
Select sum(Amount) as Total_sales, sum(Profit) as Total_Profit
from order_d;

/* 6. Which state and city generate the highest revenue? */
select l.State, l.City, sum(d.Amount) as Total_Revenue
from l_orders l inner join order_d d on l.`Order ID`= d.`Order ID`
group by l.State, l.City
order by Total_Revenue desc
limit 1;

/* 7. What is the monthly sales trend? */
select date_format(Order_Date, '%Y-%M') as `Month`, Sum(d.Amount) as Monthly_Sales
from l_orders l inner join order_d d on l.`Order ID`= d.`Order ID`
group by `Month`;

/* 8. Which category contributes the highest sales and profit? */
select Category, Sum(Amount) as Total_Sales
from order_d
group by Category
order by Total_Sales desc
limit 1;

select Category, sum(Profit) as Total_Profit
from order_d
group by Category
order by Total_Profit desc
limit 1;

/* 9. Calculate the average order value (AOV) per customer.*/
select `Order ID`, round(sum(Amount)/count(`Order ID`),2) as AOV
from order_d
group by `Order ID`
order by AOV desc;

/* 10. Find the total quantity sold for each product.*/
select `Sub-Category`, sum(Quantity) as Total_Qty_Sold
from order_d
group by `Sub-Category`
order by Total_Qty_Sold desc;

/* 11. Show customers who have placed more than 5 orders.*/
select CustomerName, count(`Order ID`) as No_of_order_placed
from l_orders
group by CustomerName
having count(`Order ID`) > 5;

/* 12. Find total sales by category and City.*/
select l.City, d.Category, sum(d.Amount) as Total_Sales
from l_orders l inner join order_d d on l.`Order ID`= d.`Order ID`
group by l.City, d.Category;

/* 13. Find customers whose names start with “S” but they are not from
	   Punjab, Delhi, Haryana*/
select CustomerName, State
from l_orders
where CustomerName Like "S%" 
           and 
State NOT IN ("Punjab", "Delhi", "Haryana");

/* 14. Identify orders and sales from cities containing "pur" 
where the product category is Electronics or Clothing, 
but exclude customers from states Delhi, Goa and Punjab.*/

select l.`Order ID`, l.City, l.State, d.Category, sum(d.Amount) as Sales_Amt
from l_orders l inner join order_d d on l.`Order ID` = d.`Order ID`
where l.City like "%pur%" 
          and
	  d.Category IN ("Electronics","Clothing")
		  and 
	  l.State NOT IN ("Punjab", "Goa","Delhi")
group by l.`Order ID`,l.City, l.State, d.Category
Order by Sales_Amt desc;

/* 15. Identify cities starting with the letter "C" where total sales exceed ₹3000
       for the categories Electronics or Furniture.*/

select l.City, d.Category, sum(d.Amount) as Total_Sales
from l_orders l inner join order_d d on l.`Order ID` = d.`Order ID`
where l.City like "C%"
          and 
	  d.Category IN ("Electronics","Furniture")
group by l.City, d.Category
having sum(d.Amount) > 3000
order by Total_Sales desc;

/* 16. Top 5 most loss-making products*/
select `Sub-Category`, sum(profit) as Total_profit 
from order_d
group by `Sub-Category`
order by Total_profit asc
limit 5;

/* 17. Identify orders where profit is negative*/
select `Order ID`, profit
from order_d
where profit < 0
order by profit desc;

/* 18. Find states where total sales are greater than the average state sales.*/
SELECT state, total_sales
FROM (
        SELECT l.state,
               SUM(d.amount) AS total_sales,
               AVG(SUM(d.amount)) OVER () AS avg_state_sales
        FROM l_orders l
        inner join order_d d
        ON l.`order id` = d.`order id`
        GROUP BY l.state
     ) t
WHERE total_sales > avg_state_sales;

/* 19. Find the categories that met or exceeded their sales targets Month wise.*/
select s.`Month of Order Date`,d.category, Sum(d.Amount) as total_sales, s.target
from order_d d inner join sales_t s on d.category = s.category
group by s.`Month of Order Date`, d.category, s.target
having Sum(d.Amount) >= s.target;

/* 20. Find the top 3 customers who generated the highest total sales in each state.*/
select state, customername, total_sales, rnk
from (select l.state, l.customername, sum(d.amount) as total_sales,
      dense_rank() over (partition by state order by sum(d.amount) desc) as rnk
      from l_orders l inner join order_d d on l.`Order ID` = d.`Order ID`
      group by l.state, l.customername) t
where rnk <= 3;
      
/* 21. Rank product categories by profit*/
select category, sum(profit) as total_profit,
dense_rank() over (order by sum(profit) desc) as profit_rnk
from order_d
group by category;

/* 22. Find the second most profitable category*/
select category, total_profit, profit_rnk
from (select category, sum(profit) as total_profit,
	  dense_rank() over (order by sum(profit) desc) as profit_rnk
      from order_d
      group by category) t
where profit_rnk = 2;

/* 23. Rank sub-categories within each category by sales*/
select category, `sub-category`, sum(amount) as total_sales,
rank() over (partition by category order by sum(amount) desc ) as rnk
from order_d
group by category,`sub-category`;

/* 24. Find customers whose total sales are higher than the average total sales of all customers.*/
with t as (
           select l.customername, sum(d.amount) as total_sales
           from  l_orders l inner join order_d d on l.`Order ID`= d.`Order ID`
           group by l.customername)
           
select customername, total_sales
from t 
where total_sales > (select avg(total_sales) as avg_sales
                     from t);
                      
/* 25. Find the category that generated the highest total sales in each state.*/
select state, category, total_sales, rnk
from (select l.state, d.category, sum(d.amount) as total_sales,
      rank() over (partition by state order by sum(d.amount) desc) as rnk
      from l_orders l inner join order_d d on l.`Order ID` = d.`Order ID`
      group by l.state, d.category) t
where rnk = 1;


