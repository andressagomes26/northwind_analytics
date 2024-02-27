with
    test_count_fct_orders as (
        select 
            count(order_sk) as count_orders
        from {{ ref("fct_orders") }}
    )

    , test_validation as (
        select 
            * 
        from test_count_fct_orders 
        where 
            count_orders != 2155
    )

select *
from test_validation