with tickets as (
    select * from {{ ref('stg_tickets') }}
)

select
    ticket_id,
    account_id,
    opened_at,
    closed_at,
    cast(opened_at as date)                  as opened_date,
    cast(closed_at as date)                  as closed_date,
    priority,
    case priority
        when 'urgent' then 1
        when 'high'   then 2
        when 'medium' then 3
        when 'low'    then 4
    end                                      as priority_rank,
    category,
    ticket_status,
    ticket_status = 'open'                   as is_open,
    datediff('hour', opened_at, closed_at)   as resolution_hours
from tickets 
