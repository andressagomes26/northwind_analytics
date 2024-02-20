with 
    territories_data as (
        select 
            territory_id
            , territory_description
            , region_id
        from {{ source('sources_data', 'territories') }}
    )

select *
from territories_data
order by territory_id
