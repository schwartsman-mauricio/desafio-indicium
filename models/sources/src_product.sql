-- Tabela
with source as (
    select
        ProductID
        , Name
    from {{ source('RAW_ADVENTURE_WORKS', 'Product') }}
)

select *
from source