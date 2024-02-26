with 
    orders_data as (
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
            , ship_region
            , ship_postal_code
            , ship_country
        from {{ source('sources_data', 'orders') }}
    )

    , ship_country_data as (
        select 
            country
            , pais
        from {{ source('sources_data_seed', 'seed_ship_country') }}
    )

    , transformed_data as (
        select
            orders_data.order_id
            , orders_data.customer_id
            , orders_data.employee_id
            , orders_data.order_date
            , orders_data.required_date
            , orders_data.shipped_date
            , orders_data.ship_via
            , orders_data.freight
            , orders_data.ship_name
            , orders_data.ship_address
            , orders_data.ship_region
            , orders_data.ship_postal_code
            , orders_data.ship_city
            , orders_data.ship_country
            , ship_country_data.pais as ship_pais
        from orders_data
        left join ship_country_data
            on orders_data.ship_country = ship_country_data.country
    )

select *
from transformed_data
order by order_id
