{{ config(materialized='table') }}

select
    SalesOrderID
    , SalesReason
    , ReasonType
    , 1 / count(*) over(partition by SalesOrderID) as Weight
from {{ ref("int_sales_reason") }}