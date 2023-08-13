create table if not exists "Sakila"."sakila_wh_meta"."dbt_audit_log"
        (
        
            event_name TEXT,
        
            event_timestamp TIMESTAMP,
        
            event_schema TEXT,
        
            event_model TEXT,
        
            event_user TEXT,
        
            event_target TEXT,
        
            event_is_full_refresh boolean,
        
            invocation_id TEXT
        
        )