{{ config(post_hook='insert into {{this}}(staff_id) VALUES (-1)') }}

select st.staff_id, st.first_name , st.last_name ,
	   concat(st.first_name ,' ', st.last_name), email,
		{{ concat_it('st.first_name', 'st.last_name') }} as full_name,
	   st.active ,
case when active = TRUE then '1'
	else '2'
end as active_status,
st.last_update,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from staff as st