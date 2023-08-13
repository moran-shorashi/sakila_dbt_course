

select
*,
'2023-08-02 16:36:55' as dbt_time
from
payment
where 1=1


and payment_date::timestamp > (select max(payment_date) from "Sakila"."sakila_wh"."payment_inc")



-- - INTERVAL '3 DAY'
-- unique_key='payment_id'