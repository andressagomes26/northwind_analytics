with 
    test_dim_customers as (
        select 
            contact_name
            , contact_title
            , customer_city
            , customer_country
        from {{ ref('dim_customers') }}
        where 
            customer_sk = '1d25f6cd08da48e6d0bea0c8361896f3'
    )

    , test_validation as (
        select 
            *
        from test_dim_customers 
        where 
            contact_name != 'Karl Jablonski'
            or contact_title != 'Owner'
            or customer_city != 'Seattle'
            or customer_country != 'EUA'
    )

select * 
from test_validation
