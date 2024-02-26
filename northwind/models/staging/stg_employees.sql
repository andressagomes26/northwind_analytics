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
            , country as employee_country
            , home_phone
            , extension
            , photo
            , notes
            , reports_to
            , photo_path
        from {{ source('sources_data', 'employees') }}
    )

    , ship_country_data as (
        select 
            country
            , pais
        from {{ source('sources_data_seed', 'seed_ship_country') }}
    )
    
    , transformed_data as (
        select 
            employees_data.employee_id
            , employees_data.employee_first_name
            , employees_data.employee_last_name
            , employees_data.employee_title
            , employees_data.employee_title_of_courtesy
            , employees_data.employee_birth_date
            , employees_data.employee_hire_date
            , employees_data.employee_address
            , employees_data.employee_city
            , employees_data.employee_region
            , employees_data.employee_postal_code
            , employees_data.employee_country
            , ship_country_data.pais as employee_pais
            , employees_data.home_phone
            , employees_data.extension
            , employees_data.photo
            , employees_data.notes
            , employees_data.reports_to
            , employees_data.photo_path
        from employees_data
        left join ship_country_data
            on employees_data.employee_country = ship_country_data.country
    )

select *
from transformed_data
order by employee_id
