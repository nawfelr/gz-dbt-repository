WITH sub AS (
SELECT 
      date_date 
    , ROUND(COUNT(DISTINCT(orders_id)),2) AS nb_transactions
    , ROUND(SUM(revenue),2) AS revenue
    , ROUND(SUM(operational_margin),2) AS operational_margin
    , ROUND(SUM(margin),2) AS margin
    , ROUND(SUM(quantity)) AS quantity
    , ROUND(SUM(purchase_cost),2) AS purchase_cost
    , ROUND(SUM(shipping_fee),2) AS shipping_fee
    , ROUND(SUM(logcost),2) AS logcost
    , ROUND(SUM(ship_cost),2) AS ship_cost
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date)

SELECT 
     date_date
     , revenue
     , margin
     , operational_margin
     , purchase_cost
     , shipping_fee
     , logcost
     , ship_cost
     , quantity
     , ROUND(revenue/NULLIF(nb_transactions, 0), 2) AS average_basket
FROM sub 
ORDER BY  date_date DESC