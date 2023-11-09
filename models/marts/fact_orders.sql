with payments as (
    select * from {{ ref("stg_payment")}}
),

customer_orders as (
    select * from {{ref("stg_orders")}}
),

order_payments as (
    select
        order_id,
        sum(case when payment_status = 'success' then amount end) as amount

    from payments
    group by 1
),

final as (
    select customer_orders.customer_id,
    customer_orders.order_id,
    customer_orders.order_date,
    order_payments.amount    as amount 
    from customer_orders left join order_payments using (order_id)
)

select * from final
