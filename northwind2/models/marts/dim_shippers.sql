with 
    stg_shippers as (
        select 
            shipper_id
            , company_name
            , phone
        from {{ref('stg_shippers')}}
    )

    , transformed_data as (
        select
            {{ dbt_utils.generate_surrogate_key(['stg_shippers.shipper_id']) }} as shipper_sk 
            , shipper_id
            , company_name
            , phone
        from stg_shippers
)

select *
from transformed_data
