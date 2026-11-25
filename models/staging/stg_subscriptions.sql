with source as (
    select * from {{ source('raw', 'subscriptions') }}
)

select
    cast(subscription_id as integer)     as subscription_id,
    cast(account_id as integer)          as account_id,
    lower(trim(plan))                    as plan_name,
    cast(seats as integer)               as seat_count,
    cast(mrr as number(10, 2))           as mrr_amount,
    lower(trim(status))                  as subscription_status,
    cast(started_at as date)             as started_date,
    cast(updated_at as timestamp_ntz)    as updated_at
from source
