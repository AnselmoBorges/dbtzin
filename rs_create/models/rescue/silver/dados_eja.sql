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

{{ config(schema='silver', alias='dados_eja') }}

with dados_eja as (
    select 
        TOTAL_REGISTOS,
        ESCOLA,
        rescue.tools.crypto(cast(INEP as varchar)) as INEP,
        ANO,
        VALOR_DESTINADO,
        'Brasil' as PAIS
    from rescue.bronze.dados_eja
)

select *
from dados_eja