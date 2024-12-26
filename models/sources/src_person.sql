-- Tabela
with source as (
    select
        BusinessEntityID
        , Title
        , FirstName
        , MiddleName
        , LastName
    from {{ source('RAW_ADVENTURE_WORKS', 'Person') }}
)

select *
from source