with 
    dados_clientes as (
        select 
            string_field_0 as customer_id
            , string_field_1 as company_name
            , string_field_2 as contact_name
            , string_field_3 as contact_title
            , string_field_4 as address
            , string_field_5 as city
            , string_field_6 as region
            , string_field_7 as postal_code
            , string_field_8 as country
            , string_field_9 as phone
            , string_field_9 as fax
        from {{ source('sources_data', 'customers') }}
    )

select *
from dados_clientes