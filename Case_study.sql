-- CASE STUDY QUESTIONS
-- 1. How many burgers were ordered? 
-- 2. How many unique customer orders were made?
--  3. How many successful orders were delivered by each runner? 
--  4. How many of each type of burger was delivered? 
--  5. How many Vegetarian and Meatlovers were ordered by each customer? 
--  6. What was the maximum number of burgers delivered in a single order? 
--  7. For each customer, how many delivered burgers had at least 1 change and how many had no changes? 
--  8. What was the total volume of burgers ordered for each hour of the day? 
--  9. How many runners signed up for each 1 week period? 
--  10. What was the average distance travelled for each customer?
--  
 use burgerbash
 select * from burger_name    -- 2 rowa
 select * from burger_runner  -- 4 rows
 select * from customer_orders   -- 14 rows
 select * from runner_orders   -- 10 rows
 
 
 -- 1. How many burgers were ordered? 
 select count(*) as no_of_order 
 from runner_orders
--  
--  SELECT COUNT(*) as 'no of orders' FROM runner_orders;


-- 2. How many unique customer orders were made?

select count(distinct order_id) as unique_order
from customer_orders


--  3. How many successful orders were delivered by each runner? 
select count(*) as delivered_order, runner_id
from runner_orders
where cancellation is null
group by runner_id
order by delivered_order desc


-- SELECT
--   runner_id,
--   COUNT(DISTINCT order_id) AS successful_orders
-- FROM runner_orders
-- WHERE cancellation IS NULL
-- GROUP BY runner_id
-- ORDER BY successful_orders DESC;

--  4. How many of each type of burger was delivered? 

select b.burger_name, count(distinct burger_id)
from burger_name as b
inner join customer_orders as c
on b.burger_id= c.burger_id
group by b.burger_name


 -- 5. How many Vegetarian and Meatlovers were ordered by each customer? 
 select c.customer_id, count( b.burger_name)  as order_count, b.burger_name
 from burger_name as b
 inner join customer_orders as c
 on b.burger_id = c.burger_id
 group by customer_id , b.burger_name 
 order by customer_id
 
--  SELECT c.customer_id, p.burger_name, COUNT(p.burger_mname) AS order_count
-- FROM customer_orders AS c
-- JOIN burger_name AS p
--  ON c.burger_id= p.burger_id
-- GROUP BY c.customer_id, p.burger_name
-- ORDER BY c.customer_id;

--  6. What was the maximum number of burgers delivered in a single order? 
select *
from burger_name as b
inner join customer_orders as c
on b.burger_id = c.burger_id
group by b.order_id 