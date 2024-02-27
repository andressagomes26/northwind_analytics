with 
    int_orders_details as (
        select
            order_id
            , customer_id
            , employee_id
            , order_date
            , required_date
            , ship_via
            , shipped_date
            , freight
            , product_id
            , unit_price
            , quantity
            , discount
            , supplier_id
        from {{ ref('int_orders_details') }}
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
            order_id
            , shipper_sk
            , shipper_id
        from {{ ref('dim_shippers') }}
    )

    , dim_products as (
        select
            product_sk
            , product_id
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
            int_orders_details.order_id
            , dim_customers.customer_sk as customer_fk
            , dim_employees.employee_sk as employee_fk
            , dim_suppliers.supplier_sk as supplier_fk
            , dim_shippers.shipper_sk as shipper_fk
            , dim_products.product_sk as product_fk
            , int_orders_details.order_date
            , int_orders_details.required_date
            , int_orders_details.shipped_date
            , int_orders_details.freight
            , int_orders_details.unit_price
            , int_orders_details.quantity
            , int_orders_details.discount
        from int_orders_details
        left join dim_customers
            on int_orders_details.customer_id = dim_customers.customer_id
        left join dim_employees
            on int_orders_details.employee_id = dim_employees.employee_id
        left join dim_shippers
            on int_orders_details.order_id = dim_shippers.order_id
        left join dim_products 
            on int_orders_details.product_id = dim_products.product_id        
        left join dim_suppliers
            on int_orders_details.supplier_id = dim_suppliers.supplier_id
    )

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'join_orders_detail.order_id'
                , 'join_orders_detail.customer_fk'
                , 'join_orders_detail.employee_fk'
                , 'join_orders_detail.supplier_fk'
                , 'join_orders_detail.shipper_fk'
                , 'join_orders_detail.product_fk'
                , 'join_orders_detail.order_date'
                ]) 
            }} as order_sk
            , join_orders_detail.order_id
            , join_orders_detail.customer_fk
            , join_orders_detail.employee_fk
            , join_orders_detail.supplier_fk
            , join_orders_detail.shipper_fk
            , join_orders_detail.order_date
            , join_orders_detail.required_date
            , join_orders_detail.shipped_date
            , join_orders_detail.freight
            , join_orders_detail.product_fk
            , join_orders_detail.unit_price
            , join_orders_detail.quantity
            , join_orders_detail.discount
        from join_orders_detail
    )

select *
from transformed_data
order by order_id
