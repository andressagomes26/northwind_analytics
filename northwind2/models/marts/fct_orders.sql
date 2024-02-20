with
    stg_orders as (
        select
            order_id
            , customer_id
            , employee_id
            , order_date
            , required_date
            , shipped_date
            , ship_via
            , freight
            , ship_name
            , ship_address
            , ship_city
            , ship_country
        from {{ ref('stg_orders') }}
    )

    , dim_customers as (
        select
            customer_sk
            , customer_id
        from {{ ref('dim_customers') }}
    )

    , dim_employees as (
        select
            employee_sk
            , employee_id
        from {{ ref('dim_employees') }}
    )

    , dim_shippers as (
        select
            shipper_sk
            , shipper_id
        from {{ ref('dim_shippers') }}
    )
    
    , join_orders as (
        select
            stg_orders.order_id
            , dim_customers.customer_sk as customer_fk
            , dim_employees.employee_sk as employee_fk
            , dim_shippers.shipper_sk as shipper_fk

            , stg_orders.order_date
            , stg_orders.required_date
            , stg_orders.shipped_date
            , stg_orders.ship_via
            , stg_orders.ship_name
            , stg_orders.ship_address
            , stg_orders.ship_city
            , stg_orders.ship_country
            , stg_orders.freight
           
        from stg_orders
        left join dim_customers
            on stg_orders.customer_id = dim_customers.customer_id
        left join dim_employees
            on stg_orders.employee_id = dim_employees.employee_id
        left join dim_shippers
            on stg_orders.ship_via = dim_shippers.shipper_id
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

    , dim_products as (
        select
            product_sk
            , product_id
            , supplier_id
        from {{ ref('dim_products') }}
    )

    , dim_suppliers as (
        select
            supplier_sk
            , supplier_id
        from {{ ref('dim_suppliers') }}
    )
    
    , join_orders_detail as (
        select
            stg_order_details.order_id
            , dim_products.product_sk as product_fk
            , dim_suppliers.supplier_sk as supplier_fk
            , stg_order_details.unit_price
            , stg_order_details.quantity
            , stg_order_details.discount
        from stg_order_details
        left join dim_products 
            on stg_order_details.product_id = dim_products.product_id
        left join dim_suppliers
            on dim_products.supplier_id = dim_suppliers.supplier_id
    )

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'join_orders.order_id'
                , 'join_orders.customer_fk'
                , 'join_orders.employee_fk'
                , 'join_orders_detail.supplier_fk'
                , 'join_orders.shipper_fk'
                , 'join_orders_detail.product_fk'
                ]) 
            }} as order_sk
            , join_orders.order_id
            , join_orders.customer_fk
            , join_orders.employee_fk
            , join_orders_detail.supplier_fk
            , join_orders.shipper_fk
            , join_orders.order_date
            , join_orders.required_date
            , join_orders.shipped_date
            , join_orders.ship_via
            , join_orders.ship_name
            , join_orders.ship_address
            , join_orders.ship_city
            , join_orders.ship_country
            , join_orders.freight
            , join_orders_detail.product_fk
            , join_orders_detail.unit_price
            , join_orders_detail.quantity
            , join_orders_detail.discount
        from join_orders
        left join join_orders_detail
            on join_orders.order_id = join_orders_detail.order_id
    )

select *
from transformed_data
