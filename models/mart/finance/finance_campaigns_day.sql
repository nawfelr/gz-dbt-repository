{{ config(materialized='view') }}
SELECT 
    date_date
, ROUND (operational_margin - ads_cost,2) AS ads_margin
, average_basket
, operational_margin
, ads_cost
, impression AS ads_impression
, click AS ads_clicks
, quantity
, revenue
, nb_transactions
, purchase_cost
, margin
, shipping_fee
, logcost AS log_cost
, ship_cost
FROM {{ ref('int_campaigns_day') }} AS camp 
INNER JOIN {{ ref('finance_days') }} AS finance
USING(date_date)