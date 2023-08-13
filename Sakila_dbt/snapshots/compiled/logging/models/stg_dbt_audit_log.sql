with audit as (

    select * from "Sakila"."sakila_wh_meta"."dbt_audit_log"

),

with_id as (

    select

        *,

        md5(cast(coalesce(cast(event_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(event_model as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(invocation_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as event_id

    from audit

)

select * from with_id