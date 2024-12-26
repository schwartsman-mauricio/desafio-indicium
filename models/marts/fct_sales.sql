{{ config(materialized='table') }}

with sales as (
    select 
        SalesOrderID
        , SalesOrderDetailId
        , OrderDate
        , DATE_TRUNC('month', OrderDate) as OrderMonthYear
        , EXTRACT(year from OrderDate) as OrderYear
        , EXTRACT(month from OrderDate) as OrderMonth
        , Status
        , s.BillToAddressID as AddressID
        , CustomerID
        , CreditCardID
        , ProductID
        , OrderQty
        , UnitPrice
        , UnitPriceDiscount
    from {{ ref("int_sales") }} as s
    left join {{ ref("int_geo") }} as g on s.BillToAddressID = g.AddressID
)

select *
from sales