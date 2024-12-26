{{ config(materialized='table') }}

select
    AddressID
    , CountryRegion
    , StateProvince
    , City
from {{ ref("int_geo") }}