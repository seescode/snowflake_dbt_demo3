{{ config(
    materialized='view'
) }}

WITH members AS (
    SELECT * FROM {{ ref('stg_members') }}
),

providers AS (
    SELECT * FROM {{ ref('stg_providers') }}
),

claims AS (
    SELECT * FROM {{ ref('stg_claims') }}
)

SELECT
    c.claim_id,
    c.claim_date,
    c.claim_amount,
    c.claim_status,
    c.diagnosis_code,
    c.procedure_code,
    m.member_id,
    m.first_name,
    m.last_name,
    m.date_of_birth,
    m.plan_id,
    p.provider_id,
    p.provider_name,
    p.specialty,
    p.network_status
FROM claims AS c
LEFT JOIN members AS m ON c.member_id = m.member_id
LEFT JOIN providers AS p ON c.provider_id = p.provider_id;