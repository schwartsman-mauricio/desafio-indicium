-- Tabela
with source as (
    select
        BusinessEntityID
        , EmailAddress
    from {{ source('RAW_ADVENTURE_WORKS', 'EmailAddress') }}
)

select *
from source