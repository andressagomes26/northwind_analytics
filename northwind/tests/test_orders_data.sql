with 
    test_orders_data as (
        select 
            order_date
            , freight
            , ship_name
            , ship_address
            , ship_city
        from {{ source('sources_data', 'orders') }}
        where
            order_date = '1996-11-15'
        
    )

    , test_validation as (
        select 
            * 
        from test_orders_data 
        where 
            freight != 41.95
            or ship_name != 'Around the Horn'
            or ship_address != 'Brook Farm Stratford St. Mary'
            or ship_city != 'Colchester'
    )

select * 
from test_validation