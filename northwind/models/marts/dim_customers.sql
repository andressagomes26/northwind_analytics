with 
    stg_customers as (
        select 
            {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk 
            , customer_id
            , company_name
            , contact_name
            , contact_title
            , customer_address 
            , customer_city
            , customer_country
            , customer_pais
        from {{ ref('stg_customers') }}
    )

select *
from stg_customers
