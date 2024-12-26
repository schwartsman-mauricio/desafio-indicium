with joined_table as (
    select 
        BusinessEntityID
        , PhoneNumber
        , t.Name as PhoneNumberType
    from {{ ref("src_person_phone") }} as p
    left join {{ ref("src_phone_type") }} as t on p.PhoneNumberTypeID = t.PhoneNumberTypeID
)

select *
from joined_table