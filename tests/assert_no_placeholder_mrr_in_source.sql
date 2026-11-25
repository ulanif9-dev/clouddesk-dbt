{{ config(severity='warn') }}

select subscription_id, mrr_amount
from {{ ref('stg_subscriptions') }}
where mrr_amount = 99999
