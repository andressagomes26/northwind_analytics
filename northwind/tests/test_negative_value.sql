with
    negative_value as (
        select 
            unit_price
        from {{ ref("dim_products") }}
    )

select *
from negative_value
where unit_price < 0