{% test test_composite_pk(model, pk_col1, pk_col2) %}

    select
        {{ pk_col1 }},
        {{ pk_col2 }},
        count(*) as n
    from {{ model }}
    group by 
        {{ pk_col1 }},
        {{ pk_col2 }}
    having n > 1

{% endtest %}