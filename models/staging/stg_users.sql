with source as (
    select * from {{ source('raw', 'users') }}
)

select
    cast(user_id as integer)             as user_id,
    cast(account_id as integer)          as account_id,
    lower(trim(email))                   as email,
    lower(trim(role))                    as user_role,
    cast(created_at as date)             as created_date,
    cast(last_login as date)             as last_login_date,
    cast(updated_at as timestamp_ntz)    as updated_at
from source
