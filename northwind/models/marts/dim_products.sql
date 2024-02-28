with 
    stg_product as (
        select 
            product_id
            , product_name
            , supplier_id
            , category_id
            , product_unit_price
            , product_units_in_stock
            , product_units_on_order
        from {{ ref('stg_products') }}
    )

    , stg_categories as (
        select 
            category_id
            , category_name
            , category_description
        from {{ ref('stg_categories') }}
    )

    , join_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_product.product_id']) }} as product_sk 
            , stg_product.product_id
            , stg_product.product_name
            , stg_product.product_unit_price
            , stg_product.product_units_in_stock
            , stg_product.product_units_on_order
            , stg_categories.category_name
            , stg_categories.category_description
        from stg_product 
        left join stg_categories
            on stg_product.category_id = stg_categories.category_id
    )

select *
from join_data
