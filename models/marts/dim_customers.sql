{{ config (
    materialized="table"
)}}

with customers as(
    select * from {{ source('jaffle_shop','customers') }}
),

orders as(
    select * from {{ source('jaffle_shop','orders') }}
),

customer_orders as (

    select
        id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        customers.id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (id)

)

select * from final
