with 
    test_dates as (
        select 
            metric_date 
            , metric_day
            , metric_month
            , metric_year
            , semester
            , dayofweek
            , fullmonth
        from {{ ref('dim_dates') }}
        where
            metric_date = '1997-01-17'
    )

    , test_validation as (
        select 
            * 
        from test_dates 
        where 
            metric_day != 17
            or metric_month != 1
            or metric_year != 1997
            or semester != 1
            or dayofweek != 'Sexta'
            or fullmonth != 'Janeiro'
    )


select * 
from test_validation