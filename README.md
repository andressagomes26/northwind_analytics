# <h1 align="center"><font color = #119fbf>Northwind - Transformação de Dados</font></h1>
Neste projeto, são realizadas transformações nos dados da empresa Northwind utilizando a ferramenta dbt. Nele, está sendo conduzido o processo abrangente de entendimento, modelagem, transformação e visualização dos dados de uma empresa fictícia denominada Northwind.

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

## Explorando KPIs e Perguntas de Negócio
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

## Criação *Star schema*
Foi criado o modelo star schema, uma estrutura de banco de dados comumente usada em Data Warehousing. Nesse modelo, foram definida a tabela fato que contêm as métricas de negócios principais e tabelas de dimensões que fornecem contextos adicionais para análises mais profundas. A implementação deste modelo foi realizada utilizando a ferramenta dbt, garantindo uma organização eficiente e fácil acesso aos dados para análises avançadas.

![Data Model Northwind- Northwind  Schema drawio](https://github.com/andressagomes26/northwind_analytics/assets/60404990/2f107e56-ead3-4362-9e09-f2230e9471ca)

# a

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/00e0aa6b-72be-4b87-bae9-909f414e8d54)

![image](https://github.com/andressagomes26/northwind_analytics/assets/60404990/326584d0-1a3e-4114-941c-fd38cb94c939)
