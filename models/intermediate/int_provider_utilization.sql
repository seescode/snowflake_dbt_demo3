{{ config(
    materialized='view'
) }}

SELECT
    provider_id,
    provider_name,
    specialty,
    network_status,
    COUNT(claim_id) AS claims_count,
    SUM(CASE WHEN claim_status = 'PAID' THEN claim_amount ELSE 0 END) AS paid_amount
FROM {{ ref('int_claims_enriched') }}
GROUP BY provider_id, provider_name, specialty, network_status;