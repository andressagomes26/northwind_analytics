with 
    stg_employees as (
        select 
            employee_id
            , employee_first_name
            , employee_last_name
            , concat(employee_first_name, ' ', employee_last_name) as full_name_employee
            , employee_title
            , employee_title_of_courtesy
            , employee_birth_date
            , employee_hire_date
            , employee_address
            , employee_city
            , employee_country
        from {{ref('stg_employees')}}
    )
    
    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_employees.employee_id']) }} as employee_sk 
            , stg_employees.employee_id
            , stg_employees.employee_first_name
            , stg_employees.employee_last_name
            , stg_employees.full_name_employee
            , stg_employees.employee_title
            , stg_employees.employee_title_of_courtesy
            , stg_employees.employee_birth_date
            , stg_employees.employee_hire_date
            , stg_employees.employee_address
            , stg_employees.employee_city
            , stg_employees.employee_country
        from stg_employees
)

select *
from transformed_data
