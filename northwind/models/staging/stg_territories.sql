with 
    dados_territorios as (
        select 
            territory_id
            , territory_description
            , region_id
        from {{ source('sources_data', 'territories') }}
    )

select *
from dados_territorios
order by order_id