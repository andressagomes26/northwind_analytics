with 
    region_data as (
        select 
            region_id
            , region_description
        from {{ source('sources_data', 'region') }}
    )

select *
from region_data
