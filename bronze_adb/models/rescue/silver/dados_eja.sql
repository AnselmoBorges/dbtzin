
select
  TOTAL_REGISTOS,
  ESCOLA,
  engenharia.tools.encrypt(cast(INEP as string)) as INEP,   -- criptografa a coluna INEP
  ANO,
  VALOR_DESTINADO,
  'ativo' as STATUS             -- adiciona a coluna Status
from
    {{ ref('tbronze') }}

/* 
    Nesse segundo caso estou realizando a criação de uma tabela no schema silver criptografada
    adiciono uma coluna fake chamada Status e faço referencia com o modelo anterior, isso vai
    criar o relacionamento entre as 2 tabelas na documentação.
*/