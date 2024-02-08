with 
    dados_pedidos as (
        select 
            order_id
            , product_id
            , unit_price
            , quantity
            , discount
        from {{ source('sources_data', 'order_details') }}
    )

select *
from dados_pedidos
order by order_id