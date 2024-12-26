-- Tabela
with source as (
    select
        SalesOrderID
        , SalesOrderDetailId
        , ProductID
        , OrderQty
        , UnitPrice
        , UnitPriceDiscount
    from {{ source('RAW_ADVENTURE_WORKS', 'SalesOrderDetail') }}
)

select *
from source