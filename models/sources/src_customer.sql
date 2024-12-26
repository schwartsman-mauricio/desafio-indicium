-- Tabela
with source as (
    select
        CustomerID
        , PersonID
        , StoreID
    from {{ source('RAW_ADVENTURE_WORKS', 'Customer') }}
)

select *
from source