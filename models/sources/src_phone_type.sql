-- Tabela
with source as (
    select
        PhoneNumberTypeID
        , Name
    from {{ source('RAW_ADVENTURE_WORKS', 'PhoneNumberType') }}
)

select *
from source