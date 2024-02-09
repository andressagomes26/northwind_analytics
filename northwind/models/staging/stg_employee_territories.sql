with 
    dados_territorio_funcionarios as (
        select 
            employee_id
            , territory_id
        from {{ source('sources_data', 'employee_territories') }}
    )

select *
from dados_territorio_funcionarios
order by employee_id
