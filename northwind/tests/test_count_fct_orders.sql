with
    test_count_fct_orders as (
        select 
            order_date
            , order_sk
        from {{ ref("fct_orders") }}
    )

    , test_validation as (
        select 
            count(order_sk) as count_orders
        from test_count_fct_orders 
        where order_date
            between '1996-01-01' and '1998-06-01'
        
    )

select *
from test_validation
where count_orders != 2155