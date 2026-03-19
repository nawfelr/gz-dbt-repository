{% macro margin_percent(revenue, purchase_cost, var=2) %}
     ROUND( SAFE_DIVIDE(({{ revenue }} - {{ purchase_cost }}), {{ revenue }}), {{ var }})
 {% endmacro %}