with 
    stg_employees as (
        select 
            {{ dbt_utils.generate_surrogate_key(['employee_id']) }} as employee_sk 
            , employee_id
            , employee_first_name
            , employee_last_name
            , employee_full_name
            , employee_title
            , employee_title_of_courtesy
            , employee_birth_date
            , employee_hire_date
            , employee_address
            , employee_city
            , employee_country
            , employee_pais
        from {{ ref('stg_employees') }}
    )

select *
from stg_employees
