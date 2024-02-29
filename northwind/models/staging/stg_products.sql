with 
    products_data as (
        select 
            product_id
            , product_name
            , supplier_id
            , category_id
            , quantity_per_unit as product_quantity_per_unit
            , unit_price as product_unit_price
            , units_in_stock as product_units_in_stock
            , units_on_order as product_units_on_order
            , reorder_level
            , discontinued
        from {{ source('sources_data', 'products') }}
    )

select *
from products_data