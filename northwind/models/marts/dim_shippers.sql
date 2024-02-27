with 
    stg_orders as (
        select
            distinct order_id
            , ship_via
            , ship_name
            , ship_address
            , ship_city
            , ship_country
            , ship_pais
        from {{ ref('stg_orders') }}
    )
    
    , stg_shippers as (
        select 
            shipper_id
            , company_name
            , phone
        from {{ ref('stg_shippers') }}
    )

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_orders.order_id', 'stg_orders.ship_via']) }} as shipper_sk 
            , stg_orders.order_id
            , stg_shippers.shipper_id
            , stg_shippers.company_name
            , stg_orders.ship_name
            , stg_orders.ship_address
            , stg_orders.ship_city
            , stg_orders.ship_country
            , stg_orders.ship_pais
        from stg_orders
        left join stg_shippers
            on stg_orders.ship_via = stg_shippers.shipper_id
)

select *
from transformed_data
order by order_id