-- Tabela
with source as (
    select
        SalesOrderID
        , SalesReasonID
    from {{ source('RAW_ADVENTURE_WORKS', 'SalesOrderHeaderSalesReason') }}
)

select *
from source