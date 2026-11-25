select ticket_id, ticket_status, opened_at, closed_at
from {{ ref('fct_tickets') }}
where (is_open and closed_at is not null)
   or (not is_open and closed_at is null)
   or closed_at < opened_at
