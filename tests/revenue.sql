-- Garanta que a receita na tabela fato de cada ano seja igual até duas casas decimais
-- à receita observada na tabela de origem.
with source as (
    select
        year(cast(OrderDate as date)) as Year
        , round(sum(OrderQty * UnitPrice), 2) as SourceRevenue
    from {{ ref('src_sales_order_detail') }} as d
    left join {{ ref('src_sales_order_header') }} as h on d.SalesOrderID = h.SalesOrderID
    group by Year
),

fact as (
    select
        year(OrderDate) as Year
        , round(sum(OrderQty * UnitPrice), 2) as FactRevenue
    from {{ ref('fct_sales') }}
    group by Year
)

select 
    s.Year
    , SourceRevenue
    , FactRevenue
from source as s
left join fact as f on s.Year = f.Year and s.SourceRevenue = f.FactRevenue
where FactRevenue is null