with 
    categories_data as (
        select 
            category_id
            , category_name
            , description as category_description 
            , picture
        from {{ source('sources_data', 'categories') }}
    )

select *
from categories_data
