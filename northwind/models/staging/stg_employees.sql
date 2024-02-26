with 
    employees_data as (
        select 
            employee_id
            , first_name as employee_first_name
            , last_name as employee_last_name
            , title as employee_title
            , title_of_courtesy as employee_title_of_courtesy
            , birth_date as employee_birth_date
            , hire_date as employee_hire_date
            , address as employee_address
            , city as employee_city
            , region as employee_region
            , postal_code as employee_postal_code
            , case
                when country = 'UK' then 'Reino Unido'
                when country = 'USA' then 'EUA'
                else country
            end as employee_country
            , home_phone
            , extension
            , photo
            , notes
            , reports_to
            , photo_path
        from {{ source('sources_data', 'employees') }}
    )

select *
from employees_data
order by employee_id
