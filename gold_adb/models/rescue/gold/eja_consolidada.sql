/* 
   O Parametro config entra com configurações especificas desse modelo,
   por exemplo, o nome desse arquivo é tbronze.sql, porém quero que a 
   tabela criada se chame dados_eja, outro detalhe é que a conexão padrão
   com o Fatabricks foi realizada no schema 'default', eu quero que a tabela
   seja criada no schema 'bronze'.

   As informações que estiverem aqui, sobressaem o arquivo dbt_preject.yml.
*/

/*
    Ou seja no config abaixo:
        - schema: quero que meu schema seja o bronze
        - alias: quero que o nome dessa tabela no schema bronze seja dados_eja
        - materialized: quero que o objeto gerado no banco de dados seja uma tabela
*/

{{ config(materialized='table') }}

with databricks as (
    select * from {{ ref('vw_adb') }}
),
bigquery as (
    select * from {{ ref('vw_bq') }}
),
redshift as (
    select * from {{ ref('vw_rs') }}
)
select
  a.escola,
  a.inep,
  a.status,
  b.cidade,
  b.estado,
  b.valor_destinado,
  c.pais,
  c.ano
from
  databricks a
join
  bigquery b on a.inep = b.inep
join
  redshift c on a.inep = c.inep