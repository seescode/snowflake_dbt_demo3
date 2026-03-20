-- models/staging/stg_claims.sql

{{ config(
    materialized='view'
) }}

SELECT
    claim_id,
    member_id,
    provider_id,
    claim_date::date AS claim_date,
    claim_amount::number(10,2) AS claim_amount,
    claim_status,
    diagnosis_code,
    procedure_code,
    created_at::timestamp AS raw_created_at,
    updated_at::timestamp AS raw_updated_at
FROM {{ source('raw', 'claims') }}