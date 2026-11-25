select subscription_id, count(*) as current_versions
from {{ ref('dim_subscription_history') }}
where is_current
group by subscription_id
having count(*) > 1
