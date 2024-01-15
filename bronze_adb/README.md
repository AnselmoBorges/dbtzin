Bem vindo ao meu projetinho malandro...

# Criptografia Unificada feat. (Unity Catalog e DBT)
* **Criado por:** Anselmo Borges
* **Data de criação:** 12.01.2014
* **Ultima atualização:** 14.01.2014

Esse projeto foi criado com o intuito de validar uma POC de integração entre clouds usando o Unity Catalog e acabou virando bem mais que isso, acabei resolvendo um problema antigo que tinha na Porto que era a ineficiencia de comunicação entre lakes Cloud. Na Porto o primeiro lake de dados nasceu na GCP e com o tempo outras fontes de dados foram surgindo como Azure e AWS, havendo hoje dados nas 3 clouds que não se falam.

Fora isso existem dados no ambiente on premisses onde a ingestão vem ocorrendo parte na GCP e parte comigo na Azure.

## Features destravadas
Como disse nesse projeto acabamos de fazer uma série de coisas bacanas como:
* Na Azure:
  * Configuração de Storage Account e containers (Metadados e Áreas Bronze e Silver)
  * Criação do connector Databricks para o Unity Catalog
  * Permissionamento no Storage Acccount
  * Criação de Workspace Databricks
  * Criação de Azure KeyVault, atribuição de privilégios para o managed identity do Databricks e secret

* No Databricks:
  * Criação do Metastore do Unity Catalog e vinculo nas Workspaces
  * Controle de acesso com grupos e usuários distintos por Workspaces
  * Criação de External Storage para os Databases Bronze e Silver de acordo com os containers
  * Criação de secret scope com Azure KeyVault
  * Configuração do `databricks-cli`
  * Criação de function SQL de criptografia no Unity Catalog
  * Restrição de acessos a catalogos por Workspaces
  * Restricão de usuários a determinados catalogos via Unity Catalog
  * Criptografia de dados sensiveis
  * Mascaramento de dados sensiveis por grupo de acesso
  * Criação de External Catalogs (BigQuery e Redshift)

* No BigQuery:
  * Criação de Dataset
  * Crição de funções
  * Geração de key json de acesso e privilégios necessários
  * Salvamento de consultas e execução remota

* No Redshift
  * Criação de ambiente Redshift
  * Liberação de acesso publico via NSG
  * Criação de função de criptografia

* No DBT-CORE:
  * Minha primeira experiência real com DBT core (nem é a versão paga) e tô completamente apaixonado.
  * Instalação do DBT-CORE local
  * Conexão com as 3 bases do projeto (Databricks, BigQuery e Redshift)
  * Ingestão de dados via `dbt seed`
  * Criação de módulos e vinculo entre eles
  * Customização em casos de multiplos Schemas
  * Criação de documentação básica

**POUCA COISA NÉ! E ISSO ACONTECEU TUDO NUM FINAL DE SEMANA OCIOSO!**

## Desenho do projeto
Segue abaixo um desenho para um entendimento melhor do projeto e o que vamos fazer.

![Desenho da arquitetura proposta](imagens/criptografia_unificada.jpg "Diagrama de Dados")



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
