SELECT 
orders_id
, date_date 
,  ROUND(margin + shipping_fee - ship.logcost - ship.ship_cost,2) AS Operational_margin
, quantity
, purchase_cost
, margin
, ship.shipping_fee
, ship.logcost
, ship.ship_cost
FROM {{ ref('int_orders_margin') }} AS int_orders 
LEFT JOIN {{ ref('stg_gz_raw__ship') }} AS ship
USING(orders_id)
ORDER BY orders_id DESC