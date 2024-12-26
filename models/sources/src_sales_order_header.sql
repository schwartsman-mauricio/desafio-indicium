-- Tabela
with source as (
    select
        SalesOrderID
        , OrderDate
        , Status
        , CustomerID
        , CreditCardID
        , BillToAddressID
    from {{ source('RAW_ADVENTURE_WORKS', 'SalesOrderHeader') }}
)

select *
from source