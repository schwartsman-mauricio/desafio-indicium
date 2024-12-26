{{ config(materialized='table') }}

with customers as (
    select
        CustomerID
        , BusinessEntityID
        , BusinessEntityType
        , Name
    from {{ ref("int_person") }}
    union all
    select
        CustomerID
        , BusinessEntityID
        , BusinessEntityType
        , Name
    from {{ ref("int_store") }}
),

all_customers as (
    select
        CustomerID
        , null as BusinessEntityID
        , null as BusinessEntityType
        , null as Name
    from {{ ref("src_customer") }}
    where 
        CustomerID not in (
            select distinct CustomerID
            from customers
        )
),

customers_crm as (
    select
        CustomerID
        , BusinessEntityType
        , Name as CustomerName
        , PhoneNumber
        , PhoneNumberType
        , EmailAddress
    from all_customers as c
    left join {{ ref("int_phone") }} as p on c.BusinessEntityID = p.BusinessEntityID
    left join {{ ref("src_email_address") }} as a on c.BusinessEntityID = a.BusinessEntityID
)

select *
from customers_crm