{{ config(materialized='view') }}
select * from cat_bq_rescue.silver.dados_eja