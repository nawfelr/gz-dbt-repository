-- SELECT * FROM {{ ref('stg_gz_raw__adwords') }}
-- UNION ALL 
-- SELECT * FROM {{ ref('stg_gz_raw__bing') }}
-- UNION ALL
-- SELECT * FROM {{ ref('stg_gz_raw__criteo') }}
-- UNION ALL 
-- SELECT * FROM {{ ref('stg_gz_raw__facebook') }}

{{ dbt_utils.union_relations(
    relations=[
        ref('stg_gz_raw__adwords'), 
        ref('stg_gz_raw__bing'),
        ref('stg_gz_raw__criteo'),
        ref('stg_gz_raw__facebook')
    ],
    exclude=["_loaded_at", "extracted_at"]
) }} 