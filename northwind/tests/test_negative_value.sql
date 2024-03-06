with
    negative_value as (
        select 
            unit_price
        from {{ source('sources_data', 'products') }}
    )

select *
from negative_value
where unit_price < 0