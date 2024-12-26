-- Tabela
with source as (
    select
        CountryRegionCode
        , Name
    from {{ source('RAW_ADVENTURE_WORKS', 'CountryRegion') }}
)

select *
from source