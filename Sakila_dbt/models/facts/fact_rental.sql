{{config(materialized='incremental') }}
with renatl_hour as (  
	select re.rental_id , st.store_id , fi.film_id , re.return_date, 
	 extract ( day from (re.return_date -re.rental_date))*24 as rental_by_day,
	(extract ( hour from (re.return_date -re.rental_date))) as rental_by_hours
	from film as fi
	inner join inventory as inv on fi.film_id =inv.film_id 
	inner join store as st on inv.store_id =st.store_id 
	inner join rental as re on inv.inventory_id =re.inventory_id 
	where re.return_date is not null and re.rental_date is not null
					)
, rental_flag as ( 
	select re.rental_id, return_date,
	case when re.return_date is null then '0'
		 else '1'
	end as is_return
	from rental as re
				)
select rh.rental_id, rh.store_id, rh.film_id,
	   rental_by_day+rental_by_hours as rental_hours_final, 
	   is_return,
	   	   '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from renatl_hour as rh
inner join rental_flag as rf on rh.rental_id = rf.rental_id
