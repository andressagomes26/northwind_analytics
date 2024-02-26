with 
    stg_orders as (
        select
            ship_via
            , ship_name
            , ship_address
            , ship_city
            , ship_country
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
            {{ dbt_utils.generate_surrogate_key(['stg_orders.ship_via']) }} as shipper_sk 
            , stg_shippers.shipper_id
            , stg_shippers.company_name
            , stg_orders.ship_name
            , stg_orders.ship_address
            , stg_orders.ship_city
            , stg_orders.ship_country
        from stg_orders
        left join stg_shippers
            on stg_orders.ship_via = stg_shippers.shipper_id
)

select *
from transformed_data
