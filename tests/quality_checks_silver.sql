/*
===============================================================================
quality checks
===============================================================================
purpose:
    runs a set of validation queries to confirm the silver layer is clean,
    standardized, and ready for transformation into gold. checks include:
    - null or duplicate keys
    - unwanted whitespace
    - value standardization
    - invalid or out-of-order dates
    - consistency between related fields

notes:
    execute these checks after loading the silver layer.
    investigate any rows returned — they indicate data issues to fix.
===============================================================================
*/

-- ====================================================================
-- silver.crm_cust_info
-- ====================================================================

-- verify cst_id has no nulls or duplicates
-- expected: no rows returned
select 
    cst_id,
    count(*) 
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null;

-- check for leading/trailing spaces in customer keys
-- expected: no rows returned
select 
    cst_key
from silver.crm_cust_info
where cst_key != trim(cst_key);

-- review marital status values for consistency
select distinct 
    cst_marital_status
from silver.crm_cust_info;

-- ====================================================================
-- silver.crm_prd_info
-- ====================================================================

-- verify prd_id has no nulls or duplicates
-- expected: no rows returned
select 
    prd_id,
    count(*) 
from silver.crm_prd_info
group by prd_id
having count(*) > 1 or prd_id is null;

-- check for unwanted spaces in product names
-- expected: no rows returned
select 
    prd_nm
from silver.crm_prd_info
where prd_nm != trim(prd_nm);

-- check for invalid or missing cost values
-- expected: no rows returned
select 
    prd_cost
from silver.crm_prd_info
where prd_cost < 0 or prd_cost is null;

-- review product line values for consistency
select distinct 
    prd_line
from silver.crm_prd_info;

-- validate date ranges (start date should not exceed end date)
-- expected: no rows returned
select *
from silver.crm_prd_info
where prd_end_dt < prd_start_dt;

-- ====================================================================
-- silver.crm_sales_details
-- ====================================================================

-- validate raw due dates before silver transformation
-- expected: no invalid dates
select 
    nullif(sls_due_dt, 0) as sls_due_dt
from bronze.crm_sales_details
where sls_due_dt <= 0
   or len(sls_due_dt) != 8
   or sls_due_dt > 20500101
   or sls_due_dt < 19000101;

-- check for incorrect date ordering (order date should be earliest)
-- expected: no rows returned
select *
from silver.crm_sales_details
where sls_order_dt > sls_ship_dt
   or sls_order_dt > sls_due_dt;

-- validate sales math: sales = quantity * price
-- expected: no rows returned
select distinct
    sls_sales,
    sls_quantity,
    sls_price
from silver.crm_sales_details
where sls_sales != sls_quantity * sls_price
   or sls_sales is null
   or sls_quantity is null
   or sls_price is null
   or sls_sales <= 0
   or sls_quantity <= 0
   or sls_price <= 0
order by sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- silver.erp_cust_az12
-- ====================================================================

-- identify birthdates outside a reasonable range
-- expected: dates between 1924-01-01 and today
select distinct
    bdate
from silver.erp_cust_az12
where bdate < '1924-01-01'
   or bdate > getdate();

-- review gender values for consistency
select distinct
    gen
from silver.erp_cust_az12;

-- ====================================================================
-- silver.erp_loc_a101
-- ====================================================================

-- review country values for consistency
select distinct
    cntry
from silver.erp_loc_a101
order by cntry;

-- ====================================================================
-- silver.erp_px_cat_g1v2
-- ====================================================================

-- check for unwanted spaces in category fields
-- expected: no rows returned
select *
from silver.erp_px_cat_g1v2
where cat != trim(cat)
   or subcat != trim(subcat)
   or maintenance != trim(maintenance);

-- review maintenance values for consistency
select distinct
    maintenance
from silver.erp_px_cat_g1v2;

