with 
    dados_pedidos as (
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
            , discontinued

        from {{ source('sources_data', 'products') }}
    )

select *
from dados_pedidos