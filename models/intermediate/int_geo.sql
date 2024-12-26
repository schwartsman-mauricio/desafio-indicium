with joined_table as (
    select 
        a.AddressID
        , c.Name as CountryRegion
        , s.Name as StateProvince
        , a.City
    from {{ ref("src_address") }} as a
    left join {{ ref("src_state_province") }} as s on a.StateProvinceID = s.StateProvinceID
    left join {{ ref("src_country_region") }} as c on s.CountryRegionCode = c.CountryRegionCode
)

select distinct *
from joined_table