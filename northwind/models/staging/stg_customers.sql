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
            , case
                when string_field_8 = 'Sweden' then 'Suécia'
                when string_field_8 = 'France' then 'França'
                when string_field_8 = 'Spain' then 'Espanha'
                when string_field_8 = 'Canada' then 'Canadá'
                when string_field_8 = 'Argentina' then 'Argentina'
                when string_field_8 = 'Switzerland' then 'Suíça'
                when string_field_8 = 'Brazil' then 'Brasil'
                when string_field_8 = 'Austria' then 'Áustria'
                when string_field_8 = 'Italy' then 'Itália'
                when string_field_8 = 'Portugal' then 'Portugal'
                when string_field_8 = 'USA' then 'EUA'
                when string_field_8 = 'Venezuela' then 'Venezuela'
                when string_field_8 = 'Ireland' then 'Irlanda'
                when string_field_8 = 'Belgium' then 'Bélgica'
                when string_field_8 = 'Norway' then 'Noruega'
                when string_field_8 = 'Denmark' then 'Dinamarca'
                when string_field_8 = 'Finland' then 'Finlândia'
                when string_field_8 = 'Poland' then 'Polônia'
                when string_field_8 = 'Germany' then 'Alemanha'
                when string_field_8 = 'UK' then 'Reino Unido'
                when string_field_8 = 'Mexico' then 'México'
                else string_field_8
            end as customer_country
            , string_field_9 as phone
            , string_field_10 as fax
        from {{ source('sources_data', 'customers') }}
    )

select *
from customers_data
order by customer_id
