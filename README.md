# northwind_analytics

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
dbt init

/home/ubuntu/desafio_ae/northwind-413620-ed005a9f60d8.json
/home/andressa/desafio_ae/northwind-413620-ed005a9f60d8.json
dbt debug


        description: "Tabela com infomações de pedidos feitos pelos clientes: identificação do cliente, data do pedido e de envio e demais dados."
        columns:
          - name: order_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null
      
      - name: order_details
        description: "Tabela com informações detalhadas sobre os produtos incluídos em cada pedido: quantidade, preço unitário e desconto."

      - name: products
        description: "Tabela com informações sobre os produtos."
        columns:
          - name: product_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null

      - name: categories
        description: "Tabela com informações sobre os produtos."
        columns:
          - name: category_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null

      - name: suppliers
        description: "Tabela com informações sobre as trasportadoras."
        columns:
          - name: supplier_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null

      - name: customers
        description: "Tabela com informações sobre os clientes da empresa."
        columns:
          - name: customer_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null

      - name: employees
        description: "Tabela com informações sobre os funcionários da empresa."
        columns:
          - name: employee_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null            

      - name: employee_territories
        description: "Tabela com informações sobre o território dos funcionários da empresa."

      - name: territories
        description: "Tabela com informações sobre território."
        columns:
          - name: territory_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null      

      - name: region
        description: "Tabela com informações sobre região."
        columns:
          - name: region_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null    

      - name: shippers
        description: "Tabela com informações sobre remetentes."
        columns:
          - name: shipper_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null    

      - name: us_states
        description: "Tabela com informações sobre Estados."
        columns:
          - name: state_id
          description: "Chave primária para essa tabela"
          tests:
            - unique
            - not_null    