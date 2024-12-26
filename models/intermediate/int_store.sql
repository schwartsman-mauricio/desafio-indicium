with customer_store as (
    select 
        CustomerID
        , StoreID as BusinessEntityID
        , 'Store' as BusinessEntityType
        , Name
    from {{ ref("src_customer") }} as c
    inner join {{ ref("src_store") }} as s on c.StoreID = s.BusinessEntityID
)

select *
from customer_store
where CustomerID not in (
    select CustomerID
    from {{ ref("int_person") }}
)