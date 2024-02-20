with 
    suppliers_data as (
        select 
            supplier_id
            , company_name
            , contact_name
            , contact_title
            , address
            , city
            , region
            , postal_code
            --, country
            , case
                when country = 'Sweden' then 'Suecia'
                when country = 'France' then 'Franca'
                when country = 'Spain' then 'Espanha'
                when country = 'Canada' then 'Canada'
                when country = 'USA' then 'EUA'
                when country = 'Norway' then 'Noruega'
                when country = 'Denmark' then 'Dinamarca'
                when country = 'Finland' then 'Finlandia'
                when country = 'UK' then 'Reino Unido'
                when country = 'Germany' then 'Alemanha'

                when country = 'Japan' then 'Japao'
                when country = 'Australia' then 'Australia'
                when country = 'Singapore' then 'Singapura'
                when country = 'Netherlands' then 'Holanda'
                else country
            end as country
            , phone
            , fax
            --, homepage
        from {{ source('sources_data', 'suppliers') }}
    )

select *
from suppliers_data
order by supplier_id
