with source as (
    select * from {{ source('raw', 'tickets') }}
)

select
    cast(ticket_id as integer)           as ticket_id,
    cast(account_id as integer)          as account_id,
    cast(opened_at as timestamp_ntz)     as opened_at,
    cast(closed_at as timestamp_ntz)     as closed_at,
    lower(trim(priority))                as priority,
    lower(trim(category))                as category,
    lower(trim(status))                  as ticket_status,
    cast(updated_at as timestamp_ntz)    as updated_at
from source
