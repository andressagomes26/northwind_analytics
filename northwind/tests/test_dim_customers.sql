with 
    test_dim_customers as (
        select 
            contact_name
            , contact_title
            , customer_city
            , customer_country
            , customer_pais
        from {{ ref('dim_customers') }}
        where 
            customer_sk = 'e7418f2e2c979d7a773f7876a35627eb'
    )

    , test_validation as (
        select 
            *
        from test_dim_customers 
        where 
            contact_name != 'Liz Nixon'
            or contact_title != 'Marketing Manager'
            or customer_city != 'Portland'
            or customer_country != 'USA'
            or customer_pais != 'Estados Unidos'
    )

select * 
from test_validation
