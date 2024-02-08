with 
    dados_funcionarios as (
        select 
            employee_id
            , last_name
            , first_name
            , title
            , title_of_courtesy
            , birth_date
            , hire_date
            , address
            , city
            , region
            , postal_code
            , country
            , home_phone
            , extension
            , photo
            , notes
            , reports_to
            , photo_path
        from {{ source('sources_data', 'employees') }}
    )

select *
from dados_funcionarios
order by employee_id