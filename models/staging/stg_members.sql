-- models/staging/stg_members.sql

{{ config(
    schema='staging',
    materialized='view'
) }}

SELECT
    member_id,
    first_name,
    last_name,
    dob::date AS date_of_birth,
    gender,
    plan_id,
    start_date::date AS plan_start_date,
    end_date::date AS plan_end_date,
    created_at::timestamp AS raw_created_at,
    updated_at::timestamp AS raw_updated_at
FROM {{ source('raw', 'members') }};