{{ config(materialized='table') }}

select
    ProductID,
    Name as ProductName
from {{ ref("src_product") }}