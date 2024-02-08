with 
    dados_transportadoras as (
        select 
            supplier_id
            , company_name
            , contact_name
            , contact_title
            , address
            , city
            , region
            , postal_code
            , country
            , phone
            , fax
            , homepage
        from {{ source('sources_data', 'suppliers') }}
    )

select *
from dados_transportadoras