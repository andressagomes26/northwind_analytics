with 
    customers_data as (
        select 
            string_field_0 as customer_id
            , string_field_1 as company_name
            , string_field_2 as contact_name
            , string_field_3 as contact_title
            , string_field_4 as customer_address
            , string_field_5 as customer_city
            , string_field_6 as customers_region
            , string_field_7 as customers_postal_code
            , string_field_8 as customer_country
            , string_field_9 as phone
            , string_field_10 as fax
        from {{ source('sources_data', 'customers') }}
    )

    , ship_country_data as (
        select 
            country
            , pais
        from {{ source('sources_data_seed', 'seed_ship_country') }}
    )

    , transformed_data as (
        select 
            customers_data.customer_id
            , customers_data.company_name
            , customers_data.contact_name
            , customers_data.contact_title
            , customers_data.customer_address
            , customers_data.customer_city
            , customers_data.customers_region
            , customers_data.customers_postal_code
            , customers_data.customer_country
            , ship_country_data.pais as customer_pais
            , customers_data.phone
            , customers_data.fax
        from customers_data
        left join ship_country_data
            on customers_data.customer_country = ship_country_data.country
    )

select *
from transformed_data