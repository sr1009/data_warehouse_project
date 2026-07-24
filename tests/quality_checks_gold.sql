/*
===============================================================================
quality checks
===============================================================================
purpose:
    runs a set of validation queries to confirm the gold layer is clean,
    consistent, and correctly linked. these checks help verify:
    - surrogate keys in dimensions are unique
    - fact tables properly reference dimension keys
    - relationships in the model behave as expected for analytics

notes:
    review any rows returned by these checks — they indicate issues that
    should be fixed before downstream reporting.
===============================================================================
*/

-- ====================================================================
-- gold.dim_customers
-- ====================================================================
-- verify customer_key is unique in the customer dimension
-- expected: no rows returned
select 
    customer_key,
    count(*) as duplicate_count
from gold.dim_customers
group by customer_key
having count(*) > 1;

-- ====================================================================
-- gold.dim_products
-- ====================================================================
-- verify product_key is unique in the product dimension
-- expected: no rows returned
select 
    product_key,
    count(*) as duplicate_count
from gold.dim_products
group by product_key
having count(*) > 1;

-- ====================================================================
-- gold.fact_sales
-- ====================================================================
-- check referential integrity between fact_sales and its dimensions
-- any rows returned indicate missing or mismatched dimension keys
select *
from gold.fact_sales f
left join gold.dim_customers c
    on c.customer_key = f.customer_key
left join gold.dim_products p
    on p.product_key = f.product_key
where p.product_key is null
   or c.customer_key is null;

