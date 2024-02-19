with 
    products_data as (
        select 
            product_id
            , product_name
            , supplier_id
            , category_id
            , quantity_per_unit
            , unit_price
            , units_in_stock
            , units_on_order
            , reorder_level
            --, discontinued
            , case
                when discontinued = 0 then 'Não'
                when discontinued = 1 then 'Sim'
            end as discontinued
        from {{ source('sources_data', 'products') }}
    )

select *
from products_data
order by product_id
