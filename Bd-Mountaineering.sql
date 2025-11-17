CREATE TABLE CLIENTES (
    cliente_id SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE CATEGORIAS (
    categoria_id SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);


CREATE TABLE PRODUTOS (
    produto_id SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10, 2) NOT NULL,
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    quantidade_estoque INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL,
    
    CHECK (preco >= 0),
    CHECK (quantidade_estoque >= 0),
    
    FOREIGN KEY (categoria_id) REFERENCES CATEGORIAS(categoria_id)
);


CREATE TABLE VENDAS (
    venda_id SERIAL PRIMARY KEY,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    status_venda VARCHAR(50) NOT NULL,
    valor_total NUMERIC(10, 2) NOT NULL,
    endereco_envio VARCHAR(255),
    cliente_id INTEGER NOT NULL,
    
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(cliente_id)
);

CREATE TABLE ITENS_VENDA (
    item_venda_id SERIAL PRIMARY KEY,
    quantidade INTEGER NOT NULL,
    preco_unitario_vendido NUMERIC(10, 2) NOT NULL,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,

    CHECK (quantidade > 0), 
    

    FOREIGN KEY (venda_id) REFERENCES VENDAS(venda_id),
    FOREIGN KEY (produto_id) REFERENCES PRODUTOS(produto_id),
    

    UNIQUE (venda_id, produto_id) 
);

SELECT * FROM CLIENTES;

SELECT * FROM CATEGORIAS;

SELECT * FROM PRODUTOS;

SELECT * FROM VENDAS;

SELECT * FROM ITENS_VENDA;