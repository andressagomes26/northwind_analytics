with 
    dados_remetentes as (
        select 
            shipper_id
            , company_name
            , phone
        from {{ source('sources_data', 'shippers') }}
    )

select *
from dados_remetentes
order by shipper_id
