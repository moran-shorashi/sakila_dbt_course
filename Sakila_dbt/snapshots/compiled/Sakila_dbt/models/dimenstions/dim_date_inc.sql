


SELECT
*
from "Sakila"."sakila_wh"."dim_date"
where 1=1



and date_key::timestamp > (select max(date_key) - INTERVAL '3 DAY' from "Sakila"."sakila_wh"."dim_date_inc")
