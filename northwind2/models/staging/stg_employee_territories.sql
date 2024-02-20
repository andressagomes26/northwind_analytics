with 
    employee_territories_data as (
        select 
            employee_id
            , territory_id
        from {{ source('sources_data', 'employee_territories') }}
    )

select *
from employee_territories_data
order by employee_id
