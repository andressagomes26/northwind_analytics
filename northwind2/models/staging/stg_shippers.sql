with 
    shippers_data as (
        select 
            shipper_id
            , company_name
            , phone
        from {{ source('sources_data', 'shippers') }}
    )

select *
from shippers_data
order by shipper_id
