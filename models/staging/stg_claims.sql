-- models/staging/stg_claims.sql

{{ config(
    schema='staging',
    materialized='view'
) }}

SELECT
    claim_id,
    member_id,
    provider_id,
    claim_date::date,
    claim_amount::number(10,2),
    claim_status,
    diagnosis_code,
    procedure_code,
    created_at::timestamp AS raw_created_at,
    updated_at::timestamp AS raw_updated_at
FROM {{ source('raw', 'claims') }};