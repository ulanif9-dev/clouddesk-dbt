select
    dbt_scd_id                             as subscription_version_key,
    subscription_id,
    account_id,
    plan_name,
    seat_count,
    mrr_amount,
    mrr_amount = 99999                     as is_mrr_suspect,
    subscription_status,
    started_date,
    dbt_valid_from                         as valid_from,
    dbt_valid_to                           as valid_to,
    dbt_valid_to = to_date('9999-12-31')   as is_current
from {{ ref('subscriptions_snapshot') }}
