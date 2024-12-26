{{ config(materialized='table') }}

select
    CreditCardID
    , CardType
from {{ ref("src_credit_card") }}