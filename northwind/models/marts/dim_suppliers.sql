with 
    stg_suppliers as (
        select 
            {{ dbt_utils.generate_surrogate_key(['supplier_id']) }} as supplier_sk 
            , supplier_id
            , company_name 
            , contact_name
            , contact_title
            , supplier_address
            , supplier_city
            , supplier_postal_code
            , supplier_country
            , supplier_pais
        from {{ ref('stg_suppliers') }}
    )

select *
from stg_suppliers