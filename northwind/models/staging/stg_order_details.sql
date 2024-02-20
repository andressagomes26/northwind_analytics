with 
    order_details_data as (
        select 
            order_id
            , product_id
            , unit_price
            , quantity
            , discount
        from {{ source('sources_data', 'order_details') }}
    )

select *
from order_details_data
order by order_id
