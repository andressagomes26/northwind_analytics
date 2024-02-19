with 
    categories_data as (
        select 
            category_id
            , category_name
            , description
            -- , picture
        from {{ source('sources_data', 'categories') }}
    )

select *
from categories_data
order by category_id
