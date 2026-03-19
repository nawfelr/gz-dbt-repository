WITH source AS (

    select 
        orders_id,
        date_date,
        revenue,
        quantity,
        ROUND(revenue - purchase_price,2) AS purchase_cost
    from {{ ref('stg_gz_raw__product') }} AS product
    INNER JOIN {{ ref('stg_gz_raw__sales') }} AS sales
    ON product.products_id = sales.products_id)

    SELECT 
        *
        , ROUND( revenue - purchase_cost ,2) AS margin 
        , {{ margin_percent('revenue', 'purchase_cost') }} AS margin_percent
        FROM source


