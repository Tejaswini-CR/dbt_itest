with orders as (
    
    select ID as order_id,
    user_id as customer_id,
    order_date,STATUS,_etl_loaded_at
    from {{source('jaffle_shop','orders')}}
)

select * from orders