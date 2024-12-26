with sales as (
    select 
        d.SalesOrderID
        , SalesOrderDetailId
        , to_date(OrderDate) as OrderDate
        , Status
        , CustomerID
        , CreditCardID
        , BillToAddressID
        , ProductID
        , OrderQty
        , UnitPrice
        , UnitPriceDiscount
    from {{ ref("src_sales_order_detail") }} as d
    inner join {{ ref("src_sales_order_header") }} as h on d.SalesOrderID = h.SalesOrderID
)

select *
from sales