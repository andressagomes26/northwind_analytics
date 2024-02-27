with
    negative_value as (
        select 
            product_unit_price
        from {{ ref("dim_products") }}
    )

select *
from negative_value
where product_unit_price < 0