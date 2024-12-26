-- Tabela
with source as (
    select
        StateProvinceID
        , CountryRegionCode
        , Name
    from {{ source('RAW_ADVENTURE_WORKS', 'StateProvince') }}
)

select *
from source