with source as (
    select * from {{ source('raw', 'accounts') }}
)

select
    cast(account_id as integer)          as account_id,
    trim(company_name)                   as account_name,
    coalesce(trim(industry), 'Unknown')  as industry,
    upper(trim(region))                  as region,
    cast(signup_date as date)            as signup_date,
    cast(updated_at as timestamp_ntz)    as updated_at
from source
