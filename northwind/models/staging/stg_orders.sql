with 
    orders_data as (
        select 
            order_id
            , customer_id
            , employee_id
            , order_date
            , required_date
            , shipped_date
            , ship_via
            , freight
            , ship_name
            , ship_address
            , ship_city
            , ship_region
            , ship_postal_code
            , case
                when ship_country = 'Sweden' then 'Suécia'
                when ship_country = 'France' then 'França'
                when ship_country = 'Spain' then 'Espanha'
                when ship_country = 'Canada' then 'Canadá'
                when ship_country = 'Argentina' then 'Argentina'
                when ship_country = 'Switzerland' then 'Suíça'
                when ship_country = 'Brazil' then 'Brasil'
                when ship_country = 'Austria' then 'Áustria'
                when ship_country = 'Italy' then 'Itália'
                when ship_country = 'Portugal' then 'Portugal'
                when ship_country = 'USA' then 'EUA'
                when ship_country = 'Venezuela' then 'Venezuela'
                when ship_country = 'Ireland' then 'Irlanda'
                when ship_country = 'Belgium' then 'Bélgica'
                when ship_country = 'Norway' then 'Noruega'
                when ship_country = 'Denmark' then 'Dinamarca'
                when ship_country = 'Finland' then 'Finlândia'
                when ship_country = 'Poland' then 'Polônia'
                when ship_country = 'UK' then 'Reino Unido'
                when ship_country = 'Mexico' then 'México'
                when ship_country = 'Germany' then 'Alemanha'
                else ship_country
            end as ship_country
        from {{ source('sources_data', 'orders') }}
    )

select *
from orders_data
order by order_id
