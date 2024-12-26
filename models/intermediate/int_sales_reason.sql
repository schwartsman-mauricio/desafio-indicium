with joined_table as (
    select 
        b.SalesOrderID
        , r.Name as SalesReason
        , ReasonType
    from {{ ref("src_sales_order_header_sales_reason") }} as b
    left join {{ ref("src_sales_reason") }} as r on b.SalesReasonID = r.SalesReasonID
)

select *
from joined_table