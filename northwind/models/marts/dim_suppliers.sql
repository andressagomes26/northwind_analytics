with 
    stg_suppliers as (
        select 
            supplier_id
            , company_name 
            , contact_name
            , contact_title
            , address as supplier_address
            , city as supplier_city
            , postal_code as supplier_city_postal_code
            , country as supplier_city_country
        from {{ ref('stg_suppliers') }}
    )

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_suppliers.supplier_id']) }} as supplier_sk 
            , supplier_id
            , company_name 
            , contact_name
            , contact_title
            , supplier_address
            , supplier_city
            , supplier_city_postal_code
            , supplier_city_country
        from stg_suppliers
    )

select *
from transformed_data