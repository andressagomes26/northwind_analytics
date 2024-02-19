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

    , stg_employee_territories as (
        select 
            employee_id
            , territory_id
        from {{ref('stg_employee_territories')}}
    )

    , stg_territories as (
        select 
            territory_id
            , territory_description
            , region_id
        from {{ref('stg_territories')}}
    )

    , stg_region as (
        select 
            region_id
            , region_description
        from {{ref('stg_region')}}
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
            , stg_employee_territories.territory_id
            , stg_territories.territory_description
            , stg_region.region_description

        from stg_employees
        left join stg_employee_territories
            on stg_employees.employee_id = stg_employee_territories.employee_id
        left join stg_territories
            on stg_employee_territories.territory_id = stg_territories.territory_id
        left join stg_region
            on stg_territories.region_id = stg_region.region_id
)

select *
from transformed_data
