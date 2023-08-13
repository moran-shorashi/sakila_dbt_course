{{config(materialized='incremental') }}
select *,
'{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from payment 