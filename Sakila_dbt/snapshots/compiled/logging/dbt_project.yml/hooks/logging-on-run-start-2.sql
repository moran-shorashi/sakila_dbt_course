
    

    insert into "Sakila"."sakila_wh_meta"."dbt_audit_log" (
        event_name,
        event_timestamp,
        event_schema,
        event_model,
        event_user,
        event_target,
        event_is_full_refresh,
        invocation_id
    )

    values (
        'run started',
        
    (current_timestamp at time zone 'utc')::TIMESTAMP
,
        '',
        '',
        'postgres',
        'dev',
        FALSE,
        '911661b3-3af8-4e57-bd14-3b61240da6b2'
    );

    commit;


