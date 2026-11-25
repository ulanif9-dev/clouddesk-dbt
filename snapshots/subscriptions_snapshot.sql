{% snapshot subscriptions_snapshot %}

{{
    config(
        target_schema='DBT_DEV',
        unique_key='subscription_id',
        strategy='check',
        check_cols=['plan_name', 'seat_count', 'mrr_amount', 'subscription_status'],
        dbt_valid_to_current="to_date('9999-12-31')"
    )
}}

select * from {{ ref('stg_subscriptions') }}

{% endsnapshot %}
