with 
    dados_categorias as (
        select 
            category_id
            , category_name
            , description
            , picture
        from {{ source('sources_data', 'categories') }}
    )

select *
from dados_categorias
order by category_id