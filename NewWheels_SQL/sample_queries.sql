-- Sample queries from LeDoux_NewWheels_submission.pdf
-- Extracted and saved for reviewer convenience. These are the exact SQL statements used in the NewWheels SQL Playground submission.

-- Question 1:
-- Find the total number of customers who have placed orders. What is the distribution of the customers across states? [4 marks]
-- Hint: For each state, count the number of customers

select 
    count(distinct customer_id) as customers,
    ct.state
from customer_t ct
join order_t ot
    using(customer_id)
group by ct.state
order by count(distinct customer_id) desc;

-- Question 2:
-- Which are the top 5 vehicle makers preferred by the customers? [4 marks]
-- Hint: For each vehicle make what is the count of the customers.

select
    pt.vehicle_maker,
    sum(ot.quantity) as total_units,
    round((sum(ot.quantity)*100.0/(select sum(quantity) from order_t)),2) as percent_market
from order_t ot
join product_t pt
    on ot.product_id = pt.product_id
group by pt.vehicle_maker
order by total_units desc
limit 5;

-- Question 3:
-- Which is the most preferred vehicle maker in each state? [4 marks]
-- Hint: Use the window function RANK() to rank based on the count of customers for each state and vehicle maker. 
-- After ranking, take the vehicle maker whose rank is 1.
select
    state,
    vehicle_maker
from (
select
    ct.state,
    pt.vehicle_maker,
    count(distinct ct.customer_id) as total_customers,
    rank() over (partition by ct.state 
        order by count(distinct ct.customer_id) desc) as rnk
from customer_t ct
join order_t ot
    using(customer_id)
join product_t pt
    using(product_id)
group by ct.state, pt.vehicle_maker) as state_ranks
where rnk = 1;

SELECT
    state,
    MIN(vehicle_maker) AS vehicle_maker,
    MAX(total_customers) AS total_customers
FROM (
    SELECT
        ct.state,
        pt.vehicle_maker,
        COUNT(DISTINCT ct.customer_id) AS total_customers,
        RANK() OVER (
            PARTITION BY ct.state 
            ORDER BY COUNT(DISTINCT ct.customer_id) DESC
        ) AS rnk
    FROM customer_t ct
    JOIN order_t ot USING (customer_id)
    JOIN product_t pt USING (product_id)
    GROUP BY ct.state, pt.vehicle_maker
) AS state_ranks
WHERE rnk = 1
GROUP BY state
HAVING COUNT(*) = 1
order by total_customers desc;

-- Question 4:
-- Find the overall average rating given by the customers. What is the average rating in each quarter? [5 marks]
-- Consider the following mapping for ratings:
-- “Very Bad”: 1, “Bad”: 2, “Okay”: 3, “Good”: 4, “Very Good”: 5
-- Hint: Use subquery and assign numerical values to feedback categories using a CASE statement. 
-- Then, calculate the average feedback count per quarter. Use a subquery to convert feedback 
-- into numerical values and group by quarter_number to compute the average.

select
    quarter_number,
    round(avg(feedback_rating),3) as avg_rating,
    round(avg(avg(feedback_rating)) over(),3) as overall_avg,
    max(feedback_rating) as max_rating,
    sum(case when feedback_rating = 5 then 1 else 0 end) as max_count,    
    min(feedback_rating) as min_rating,
    sum(case when feedback_rating = 1 then 1 else 0 end) as min_count
from (
    select
        quarter_number,
    case 
        when customer_feedback = 'Very Bad' then 1
        when customer_feedback = 'Bad' then 2
        when customer_feedback = 'Okay' then 3
        when customer_feedback = 'Good' then 4
        when customer_feedback = 'Very Good' then 5
    end as feedback_rating
    from order_t)
group by quarter_number
order by quarter_number asc;

-- Question 5:
-- Find the percentage distribution of feedback from the customers. Are customers getting more dissatisfied over time? [5 marks]
-- Hint: Calculate the percentage of each feedback type by using conditional aggregation. 
-- For each feedback category, use a CASE statement to count the occurrences and then divide by the total count of feedback for the quarter, multiplied by 100 to get the percentage. 
-- Finally, group by quarter_number and order the results to reflect the correct sequence.

select
    quarter_number,
    round(sum(case when customer_feedback = 'Very Bad' then 1 else 0 end)*100.0 / count(customer_feedback),2) as Very_Bad,
    round(sum(case when customer_feedback = 'Bad' then 1 else 0 end)*100.0 / count(customer_feedback),2) as Bad,
    round(sum(case when customer_feedback = 'Okay' then 1 else 0 end)*100.0 / count(customer_feedback),2) as Okay,
    round(sum(case when customer_feedback = 'Good' then 1 else 0 end)*100.0 / count(customer_feedback),2) as Good,
    round(sum(case when customer_feedback = 'Very Good' then 1 else 0 end)*100.0 / count(customer_feedback),2) as Very_Good
from order_t
group by quarter_number;

-- Question 6:
-- What is the trend of the number of orders by quarter? [3 marks]
-- Hint: Count the number of orders for each quarter.

select
    quarter_number as quarter,
    count(order_id) as total_orders,
    sum(quantity) as total_quant
from order_t
group by quarter_number;


-- Question 7:
-- Calculate the net revenue. What is the quarter-over-quarter % change? [5 marks]
-- Hint: Net Revenue is the amount obtained by multiplying the number of units sold by the price after deducting the discounts applied.
-- Quarter over Quarter percentage change in revenue means what is the change in revenue from the subsequent quarter to the previous quarter in percentage.
-- Calculate the revenue for each quarter by summing the quantity of product and the discounted vehicle price. Use the LAG function to get the revenue from the previous quarter, and then compute the quarter-over-quarter percentage change based on the current and previous revenue values.
-- Ensure the results are ordered by quarter_number to maintain the correct sequence.

select
    quarter_number,
    net_revenue as current_q_revenue,
    lag(net_revenue) over (order by quarter_number) as previous_q_revenue,
    round((net_revenue - lag(net_revenue) over (order by quarter_number))
        *100.0 / lag(net_revenue) over (order by quarter_number), 2) as percent_change
from ( 
select
    quarter_number,
    round(sum((vehicle_price * (1-discount)) * quantity), 2) as net_revenue
from order_t
group by quarter_number
order by quarter_number asc);

-- Question 8:
-- What is the combined trend of net revenue and orders by quarter? [4 marks]
-- Hint: Find out the sum of net revenue and count the number of orders for each quarter.

select
    quarter_number,
    total_orders,
    round((total_orders - lag(total_orders) over(order by quarter_number))
        *100.0 / lag(total_orders) over(order by quarter_number), 2) as perc_chg_orders,
    net_revenue,
    round((net_revenue - lag(net_revenue) over (order by quarter_number))
        *100.0 / lag(net_revenue) over (order by quarter_number), 2) as perc_chg_rev
from (
select
    quarter_number,
    count(order_id) as total_orders,
    round(sum((vehicle_price * (1-discount)) * quantity), 2) as net_revenue
from order_t
group by quarter_number
order by quarter_number asc);



-- Question 9:
-- What is the average discount offered for different credit card types? [3 marks]
-- Hint: Find out the average of discount for each credit card type.

select
    ct.credit_card_type,
    round(avg(ot.discount),3) as average_discount,
    max(ot.discount) as max_discount,
    min(ot.discount) as min_discount
from customer_t ct
join order_t ot
    using(customer_id)
group by ct.credit_card_type;

-- Question 10:
-- What is the average time taken to ship the placed orders for each quarter? [3 marks]
-- Hint: Please use the julianday function instead of the DATEDIFF function to find the difference between the ship date and the order date.
-- The SQL Playground Editor is built on the SQLite platform, which doesn’t support the DATEDIFF function available in MySQL

select
    quarter_number,
    round(avg(julianday(ship_date) - julianday(order_date)), 3) as avg_delivery_time
from order_t
group by quarter_number
order by quarter_number asc;

-- Summary Metrics

select  
    round(sum((ot.vehicle_price * (1-ot.discount)) * quantity), 2) as total_revenue,
    count(ot.order_id) as total_orders,
    count(distinct ct.customer_id) as total_customers,
    round(avg(
        case 
            when customer_feedback = 'Very Bad' then 1
            when customer_feedback = 'Bad' then 2
            when customer_feedback = 'Okay' then 3
            when customer_feedback = 'Good' then 4
            when customer_feedback = 'Very Good' then 5
        end), 2) as avg_feedback_rating,
    round(sum(case when ot.quarter_number = 4 then
                (ot.vehicle_price * (1-ot.discount)) * quantity end),2) as q4_rev,
    count(case when ot.quarter_number = 4 then ot.order_id end) as q4_orders,
    round(avg(julianday(ot.ship_date) - julianday(ot.order_date)), 2) as avg_delivery_time,
    round((count(case when ot.customer_feedback in ('Good', 'Very Good') then 1 end)
        *100.0 / count(ot.customer_feedback)), 2) as good_feedback
from customer_t ct
join order_t ot
    using(customer_id);
