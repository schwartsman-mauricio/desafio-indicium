-- Tabela
with source as (
    select
        CreditCardID
        , CardType
    from {{ source('RAW_ADVENTURE_WORKS', 'CreditCard') }}
)

select *
from source