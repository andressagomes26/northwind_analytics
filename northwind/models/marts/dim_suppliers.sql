with 
    stg_suppliers as (
        select 
            supplier_id
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

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_suppliers.supplier_id']) }} as supplier_sk 
            , supplier_id
            , contact_name
            , contact_title
            , supplier_address
            , supplier_city
            , supplier_postal_code
            , supplier_country
            , supplier_pais
        from stg_suppliers
    )

select *
from transformed_data