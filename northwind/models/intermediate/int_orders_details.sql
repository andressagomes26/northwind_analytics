with
    stg_orders as (
        select
            order_id
            , customer_id
            , employee_id
            , order_date
            , required_date
            , ship_via
            , shipped_date
            , freight
        from {{ ref('stg_orders') }}
    )

    , stg_order_details as (
        select
            order_id
            , product_id
            , unit_price
            , quantity
            , discount
        from {{ ref('stg_order_details') }} 
    )

    , stg_product as (
        select 
            product_id
            , supplier_id
        from {{ ref('stg_products') }}
    )

    , transformed_data as (
        select
            stg_orders.order_id
            , stg_orders.customer_id
            , stg_orders.employee_id
            , stg_product.supplier_id
            , stg_order_details.product_id
            , stg_orders.order_date
            , stg_orders.required_date
            , stg_orders.ship_via
            , stg_orders.shipped_date
            , stg_orders.freight
            , stg_order_details.unit_price
            , stg_order_details.quantity
            , stg_order_details.discount
        from stg_orders
        left join stg_order_details
            on stg_orders.order_id = stg_order_details.order_id
        left join stg_product 
            on stg_order_details.product_id = stg_product.product_id
    )

select *
from transformed_data
