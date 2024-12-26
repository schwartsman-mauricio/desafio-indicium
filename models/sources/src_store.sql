-- Tabela
with source as (
    select
        BusinessEntityID
        , Name
    from {{ source('RAW_ADVENTURE_WORKS', 'Store') }}
)

select *
from source