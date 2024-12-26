with customer_unknown as (
    select 
        CustomerID
        , null as BusinessEntityID
        , null as BusinessEntityType
        , null as Name
    from {{ ref("src_customer") }} as c
    where 
        StoreID is null
        and PersonID is null
)

select *
from customer_unknown