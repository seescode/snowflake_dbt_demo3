-- models/staging/stg_providers.sql

{{ config(
    materialized='view'
) }}

SELECT
    provider_id,
    provider_name,
    specialty,
    network_status,
    created_at::timestamp AS raw_created_at,
    updated_at::timestamp AS raw_updated_at
FROM {{ source('raw', 'providers') }}