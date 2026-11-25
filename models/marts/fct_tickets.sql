select
    ticket_id,
    account_id,
    opened_date,
    closed_date,
    opened_at,
    closed_at,
    priority,
    priority_rank,
    category,
    ticket_status,
    is_open,
    resolution_hours
from {{ ref('int_tickets_enriched') }}
