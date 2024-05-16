# <h1 align="center"><font color = #119fbf>Northwind - Transformação de Dados</font></h1>
Neste projeto, são realizadas transformações nos dados da empresa Northwind utilizando a ferramenta dbt. Nele, está sendo conduzido o processo abrangente de entendimento, modelagem, transformação e visualização dos dados de uma empresa fictícia denominada Northwind.

###  Objetivos 

- Realizar a transformação e análise dos dados brutos da Northwind para extrair insights relevantes e coerentes.
- Aplicar conceitos de *Business Intelligence* para visualização e compreensão dos dados, a fim de extrair insights para orientar decisões estratégicas e impulsionar o crescimento da empresa, fortalecendo sua posição competitiva no mercado.
- Desenvolver e implementar uma infraestrutura de dados flexível, adaptável e acessível, alinhada à metodologia Modern Data Stack (MDS).
- Promover a cultura data driven e aumentar a capacidade analítica da empresa.
- Aplicar conceitos de Businees Inteligence para visualização e entendimento dos daods.


## Instalar e executar o projeto

- Criar ambiente virtual:

```bash
python -m venv venv
```

- Ativar ambiente virtual:
```
source venv/bin/activate
```

- Instalar dependências: 
```bash
pip install -r requirements.txt
```

- Entrar na pasta do projeto:
```bash
cd northwind/
```

- Executar os modelos:
```bash
dbt run
```

- Executar os testes:
```bash
dbt test
```


## Planejamento do Projeto
Para implementação do projeto e criação de infraestruturas de dados foi utilizada uma combinação de boas práticas e ferramentas, definida como Modern Data Stack (MDS).

### Explorando KPIs e Perguntas de Negócio
Com o objetivo de agregar valor e fornecer respostas precisas às principais perguntas de negócio, foi desenvolvido um *Data Planning* abrangente. Este plano aborda um dicionário dos dados, dimensões e métricas analisadas, KPIs e questões estratégicas essenciais para impulsionar o sucesso da organização. 

Para acessar o *Data Planning* completo: [Link](https://docs.google.com/spreadsheets/d/1DBWSw4Ze7Jrt-6uNas9ogmbMdK80h45A/edit?usp=sharing&ouid=112453950943237838733&rtpof=true&sd=true)

| KPI | Descrição |
|----------|----------|
| Total de Pedidos |	Número total de pedidos |
| Receita Total	| Valor obtido pela empresa com as vendas (faturamento bruto ou renda total) |
| Receita Líquida| 	Valor obtido pela empresa com as vendas após a redução de descontos | 
| Média de Itens|  por Pedido	Quantidade média de produtos em cada pedido |  
| Margem de Lucro|  Produto	Define a margem de lucro média por produto | 
| Produto mais recorrente| 	O produto mais recorrente em pedidos | 
| Descontinuado| Quantidade de produtos que não estão mais disponível para venda | 
| Produtos por Fornecedor| 	Quantidade de produtos fornecidos por cada fornecedor | 
| Valor Médio de Compra por Cliente | Valor médio gasto por um cliente específico em suas compras durante um período | 
| Ticket Médio | Valor médio gasto em todas as transações | 
| Razão Cliente/Funcionário | Número de Clientes Atendidos por Funcionário | 
| Tempo Médio de Entrega | Define o Tempo Médio de Entrega por Transportadora | 

| Perguntas de Negócio |
|----------|
| Existem padrões sazonais nas vendas de determinados produtos?		 |			
| Quais produtos têm a maior margem de lucro? |		
| É possível analisar quais são os clientes que têm maior impacto nas vendas totais da empresa? |					
| Quais são os diferentes segmentos de clientes com base em seu histórico de compras? | É possível personalizar ofertas ou campanhas de marketing para diferentes segmentos de clientes? |					
| Quais são os vendedores mais produtivos em termos de vendas ou número de pedidos? |					
| Quais são os países que apresentam os melhores desempenhos? |					
| Quais são os principais motivos para atrasos ou problemas na entrega de pedidos aos clientes? |					
| É possivel identificar se existem diferença na venda de produtos com desconto ou sem desconto? |

## Armazenamento e gerenciamento de dados
Para garantir armazenamento dos dados e consultas de grandes volumes de dados, foi utilizado o Data Warehouse Google BigQuery, que possibilita análises e o gerenciamento de informações em larga escala.

![Data Model Northwind-Arquitetura drawio (1)](https://github.com/andressagomes26/northwind_analytics/assets/60404990/a5bdbc25-7462-49e7-a4dd-bbe4c9b1c79c)

## Criação *Star schema*
Foi criado o modelo star schema, uma estrutura de banco de dados comumente usada em Data Warehousing. Nesse modelo, foram definida a tabela fato que contêm as métricas de negócios principais e tabelas de dimensões que fornecem contextos adicionais para análises mais profundas. A implementação deste modelo foi realizada utilizando a ferramenta dbt, garantindo uma organização eficiente e fácil acesso aos dados para análises avançadas.

![Data Model Northwind- Northwind  Schema drawio](https://github.com/andressagomes26/northwind_analytics/assets/60404990/74bda6fe-e342-4428-8010-6df51c407d4b)

## Transformação de Dados
Para ganhos de eficiência no projeto, foi realizada a abordagem ELT (Extract-Load-Transform), na qual, os dados foram extraídos, carregados e em seguida, transformados. Trata-se de uma abordagem mais rápida e flexível para a transformação de dados brutos em dados modelados dentro do Data Warehouse. A principal ferramenta utilizada para a transformação dos dados foi o [DBT](https://www.getdbt.com/) (data build tool). A tecnologia permite  executar o processo de ELT para a transformação dos dados brutos em dados modelados, garantindo um código analítico, capaz de produzir resultados de maior qualidade, realizar testes e documentar consultas.

## Business Intelligence

Para fornecer a visualização, as análises de informações e gerar insights que agregam valor à tomada de decisão empresarial foi utilizada a ferramenta de Business Intelligence *Power BI*, com intuito de analisar os principais indicadores, otimizar processos e tomar decisões assertivas.

Para acessar o *Dashboard* completo: [Link](https://app.powerbi.com/view?r=eyJrIjoiYTIyYmRiYTUtMTVkYy00M2Q3LWFhNDQtYzAwMjA4NTI0MzA1IiwidCI6ImQ5NGUwYTgxLWE2OWYtNDQwYy05NzY3LWI2N2RkNGIxMzc5ZCJ9&pageName=ReportSection6f52c72540bb4cfca6f3).

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/00e0aa6b-72be-4b87-bae9-909f414e8d54)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/326584d0-1a3e-4114-941c-fd38cb94c939)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/77bb1221-d87f-4f5a-a344-2f6e8d7197aa)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/d58eec1b-91cd-4009-a978-0e39f35d61be)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/f619b0ec-0182-4578-b98b-bdd780963e05)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/3a5c4a71-e92f-401c-81bd-54191b9b6d60)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/d63e71ab-eac6-473a-8414-92ee4f8d2e1b)

## Autores
Andressa Gomes Moreira - andressagomesm26@gmail.com

