
with customers as (

    select ID as customers_id,
    FIRST_NAME,
    LAST_NAME 
    from {{ source('jaffle_shop', 'customers') }}
)    

select * from customers
