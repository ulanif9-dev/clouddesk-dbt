user_summary as (
    select
        account_id,
        count(*)                        as user_count,
        count_if(user_role = 'admin')   as admin_count
    from {{ ref('stg_users') }}
    group by account_id
)

select
    a.account_id,
    a.account_name,
    a.industry,
    a.region,
    a.signup_date,
    coalesce(s.subscription_count, 0)         as subscription_count,
    coalesce(s.active_subscription_count, 0)  as active_subscription_count,
    coalesce(s.active_seats, 0)               as active_seats,
    coalesce(s.active_mrr, 0)                 as active_mrr,
    coalesce(s.suspect_mrr_count, 0)          as suspect_mrr_count,
    coalesce(u.user_count, 0)                 as user_count,
    coalesce(u.admin_count, 0)                as admin_count
from accounts a
left join subscription_summary s on a.account_id = s.account_id
left join user_summary u         on a.account_id = u.account_id
