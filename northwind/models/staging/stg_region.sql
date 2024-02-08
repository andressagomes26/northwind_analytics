with 
    dados_regiao as (
        select 
            region_id
            , region_description
        from {{ source('sources_data', 'region') }}
    )

select *
from dados_regiao
order by region_id