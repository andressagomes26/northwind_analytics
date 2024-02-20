with 
    stg_product as (
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
        from {{ ref('stg_products') }}
    )

    , stg_categories as (
        select 
            category_id
            , category_name
            , description
        from {{ ref('stg_categories') }}
    )

    -- , stg_suppliers as (
    --     select 
    --         supplier_id
    --         , company_name
    --         , contact_name
    --         , contact_title
    --         , address
    --         , city
    --         , postal_code
    --         , country
    --     from {{ ref('stg_suppliers') }}
    -- )

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_product.product_id']) }} as product_sk 
            , stg_product.product_id
            , stg_product.product_name
            , stg_categories.category_id
            , stg_categories.category_name
            , stg_categories.description   
            , stg_product.quantity_per_unit
            , stg_product.unit_price
            , stg_product.units_in_stock
            , stg_product.units_on_order
            , stg_product.reorder_level
            , stg_product.supplier_id
            -- , stg_suppliers.supplier_id
            -- , stg_suppliers.company_name
            -- , stg_suppliers.contact_name
            -- , stg_suppliers.contact_title
            -- , stg_suppliers.address
            -- , stg_suppliers.city
            -- , stg_suppliers.postal_code
            -- , stg_suppliers.country
        from stg_product 
        left join stg_categories
            on stg_product.category_id = stg_categories.category_id
        -- left join stg_suppliers
        --     on stg_product.supplier_id = stg_suppliers.supplier_id
    )

select *
from transformed_data