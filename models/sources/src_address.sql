-- Tabela
with source as (
    select
        AddressID
        , StateProvinceID
        , City
    from {{ source('RAW_ADVENTURE_WORKS', 'Address') }}
)

select *
from source