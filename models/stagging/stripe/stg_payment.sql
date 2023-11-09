with stg_payment as(

    select id       as payment_id,
    orderid         as order_id,
    paymentmethod   as payment_mode,
    status          as payment_status,
    amount / 100    as amount, -- to convert the amount from cents to dollars
    created         as created_at 
    
    from  {{ source("stripe","payment")}}
)

select * from stg_payment