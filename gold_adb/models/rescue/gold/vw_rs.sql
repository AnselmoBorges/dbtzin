{{ config(materialized='view') }}
select * from cat_rs_rescue.silver.dados_eja