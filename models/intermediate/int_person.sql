with customer_person as (
    select 
        CustomerID
        , PersonID as BusinessEntityID
        , 'Person' as BusinessEntityType
        , concat(
            case when Title is null then '' else concat(trim(Title), ' ') end,
            case when FirstName is null then '' else concat(trim(FirstName), ' ') end,
            case when MiddleName is null then '' else concat(trim(MiddleName), ' ') end,
            case when LastName is null then '' else trim(LastName) end
        ) as Name
    from {{ ref("src_customer") }} as c
    inner join {{ ref("src_person") }} as p on c.PersonID = p.BusinessEntityID
)

select *
from customer_person