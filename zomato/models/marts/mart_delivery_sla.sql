select city,
hour(try_to_timestamp_ntz(order_timestamp)) as order_hour,
count_if(is_delivered) as delivered_orders,
round(median(try_to_decimal(delivery_time_min, 10, 2)),1) as p50,
round(percentile_cont(0.9) within group (order by try_to_decimal(delivery_time_min, 10, 2)),1) as p90
from {{ ref('fct_orders') }}
where is_delivered group by 1,2