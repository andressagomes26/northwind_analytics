with 
    dados_produtos as (
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
                else discontinued
            end as discontinued
        from {{ source('sources_data', 'products') }}
    )

select *
from dados_produtos
order by product_id
