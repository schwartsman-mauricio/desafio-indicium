-- Tabela
with source as (
    select
        SalesReasonID
        , Name
        , ReasonType
    from {{ source('RAW_ADVENTURE_WORKS', 'SalesReason') }}
)

select *
from source