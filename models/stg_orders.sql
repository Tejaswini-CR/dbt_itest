with orders as (
    select ID as orders_id,
    user_id as customers_id,
    order_date,STATUS,_etl_loaded_at
    from {{source('jaffle_shop','orders')}}
)

select * from orders