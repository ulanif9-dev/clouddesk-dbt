select
    account_id,
    account_name,
    industry,
    region,
    signup_date,
    subscription_count,
    active_subscription_count,
    active_seats,
    active_mrr,
    suspect_mrr_count,
    user_count,
    admin_count
from {{ ref('int_account_profile') }}
