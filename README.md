# <h1 align="center"><font color = #119fbf>Transformação nos Dados Northwind </font></h1>
Neste projeto, são realizadas transformações nos dados da empresa Northwind utilizando a ferramenta dbt.

# Instalar e executar o projeto

Para utilizar este projeto deve-se clonar o repositório do github e executar o seguinte comando dentro da pasta do projeto:

Criar ambiente virtual:

```bash
python -m venv venv
```

Ativar ambiente virtual:
```
source venv/bin/activate
```

Instalar dependências: 
```bash
pip install -r requirements.txt
```

Entrar na pasta do projeto:
```bash
cd northwind/
```

Executar os modelos:
```bash
dbt run
```

Executar os testes:
```bash
dbt test
```
