with 
    stg_employees as (
        select 
            employee_id
            , employee_first_name
            , employee_last_name
            , concat(employee_first_name, ' ', employee_last_name) as employee_full_name
            , employee_title
            , employee_title_of_courtesy
            , employee_birth_date
            , employee_hire_date
            , employee_address
            , employee_city
            , employee_country
            , employee_pais
        from {{ref('stg_employees')}}
    )
    
    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_employees.employee_id']) }} as employee_sk 
            , stg_employees.employee_id
            , stg_employees.employee_first_name
            , stg_employees.employee_last_name
            , stg_employees.employee_full_name
            , stg_employees.employee_title
            , stg_employees.employee_title_of_courtesy
            , stg_employees.employee_birth_date
            , stg_employees.employee_hire_date
            , stg_employees.employee_address
            , stg_employees.employee_city
            , stg_employees.employee_country
            , stg_employees.employee_pais
        from stg_employees
)

select *
from transformed_data
