{{ config(
    materialized='view'
) }}

SELECT
    member_id,
    COUNT(claim_id) AS total_claims,
    SUM(CASE WHEN claim_status = 'PAID' THEN claim_amount ELSE 0 END) AS total_paid,
    SUM(CASE WHEN claim_status = 'DENIED' THEN claim_amount ELSE 0 END) AS total_denied
FROM {{ ref('int_claims_enriched') }}
GROUP BY member_id;