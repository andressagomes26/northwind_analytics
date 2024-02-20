with 
    stg_customers as (
        select 
            customer_id
            , company_name
            , contact_name
            , contact_title
            , address 
            , city 
            --, region
            --, postal_code
            , country
            --, phone
            --, fax
        from {{ref('stg_customers')}}
)
    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_customers.customer_id']) }} as customer_sk 
            , customer_id
            , company_name
            , contact_name
            , contact_title
            , address as customer_address
            , city as customer_city
            , country as customer_country
        from stg_customers
)

select *
from transformed_data
