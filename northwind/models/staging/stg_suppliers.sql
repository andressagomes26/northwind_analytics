with 
    suppliers_data as (
        select 
            supplier_id
            , company_name
            , contact_name
            , contact_title
            , address as supplier_address
            , city as supplier_city
            , region as supplier_region
            , postal_code as supplier_postal_code
            , country as supplier_country
            , phone
            , fax
            , homepage
        from {{ source('sources_data', 'suppliers') }}
    )

    , ship_country_data as (
        select 
            country
            , pais
        from {{ ref('seed_ship_country') }}
    )
    
    , transformed_data as (
        select 
            suppliers_data.supplier_id
            , suppliers_data.company_name
            , suppliers_data.contact_name
            , suppliers_data.contact_title
            , suppliers_data.supplier_address
            , suppliers_data.supplier_city
            , suppliers_data.supplier_region
            , suppliers_data.supplier_postal_code
            , suppliers_data.supplier_country
            , ship_country_data.pais as supplier_pais
            , suppliers_data.phone
            , suppliers_data.fax
            , suppliers_data.homepage
        from suppliers_data
        left join ship_country_data
            on suppliers_data.supplier_country = ship_country_data.country  
    )

select *
from transformed_data
