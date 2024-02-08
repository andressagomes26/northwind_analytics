with 
    dados_estados as (
        select 
            state_id
            , state_name
            , state_abbr
            , state_region
        from {{ source('sources_data', 'us_states') }}
    )

select *
from dados_estados
order by state_id