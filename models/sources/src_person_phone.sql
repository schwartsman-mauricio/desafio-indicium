-- Tabela
with source as (
    select
        BusinessEntityID
        , PhoneNumber
        , PhoneNumberTypeID
    from {{ source('RAW_ADVENTURE_WORKS', 'PersonPhone') }}
)

select *
from source