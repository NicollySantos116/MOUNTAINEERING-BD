CREATE TABLE PEDIDOS (

    pedido_id SERIAL PRIMARY KEY,

    cliente_id INTEGER NOT NULL,

    data_pedido TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    

    valor_total NUMERIC(10, 2) NOT NULL,
    
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(cliente_id)
);
CREATE TABLE ITENS_PEDIDO (
    item_pedido_id SERIAL PRIMARY KEY,
    
    pedido_id INTEGER NOT NULL,
    
    produto_id INTEGER NOT NULL,

    quantidade INTEGER NOT NULL CHECK (quantidade > 0),

    preco_unitario NUMERIC(10, 2) NOT NULL,
    
    FOREIGN KEY (pedido_id) REFERENCES PEDIDOS(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES PRODUTOS(produto_id)
);

INSERT INTO CATEGORIAS (nome_categoria) VALUES
('Camadas Base (Base Layer)'),
('Camadas Isolantes (Mid Layer)'),
('Camadas Externas (Shell)'),
('Calçados Técnicos'),
('Acessórios e Proteção');


INSERT INTO PRODUTOS (nome_produto, descricao, preco, tamanho, cor, quantidade_estoque, categoria_id) VALUES
('Camisa Térmica Lã Merino', 'Alta respirabilidade, ideal para baixas temperaturas.', 349.00, 'M', 'Azul Cobalto', 85, 1),
('Calça Base Sintética', 'Secagem rápida e ajuste ergonômico.', 219.00, 'M', 'Preto', 110, 1),
('Fleece Polartec 300', 'Isolamento térmico de alto desempenho.', 499.00, 'G', 'Cinza Chumbo', 60, 2),
('Jaqueta Down Híbrida', 'Leveza e calor extremo com enchimento de plumas.', 989.00, 'M', 'Verde Musgo', 45, 2),
('Casaco Impermeável Gore-Tex', 'Proteção máxima contra vento e chuva.', 1850.00, 'G', 'Vermelho', 30, 3),
('Calça Hardshell Reforçada', 'Resistente à abrasão, para uso com crampons.', 1290.00, '42', 'Preto', 55, 3),
('Bota de Alpinismo Dupla', 'Compatível com crampons automáticos, para alta montanha.', 2500.00, '41', 'Laranja/Preto', 25, 4),
('Meia de Trekking Acolchoada', 'Previne bolhas e otimiza a circulação.', 99.00, 'Único', 'Mescla', 250, 5),
('Capacete de Escalada', 'Leve e ventilado, com ajuste fácil.', 420.00, 'Único', 'Branco', 70, 5),
('Luva Shell Impermeável', 'Isolamento e proteção contra água em clima frio.', 560.00, 'L', 'Preto', 40, 5);

INSERT INTO CLIENTES (nome_cliente, email, telefone, data_cadastro) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98765-4321', '2025-11-01'),
('Bruno Costa', 'bruno.costa@email.com', '(21) 99876-5432', '2025-11-05'),
('Carla Mendes', 'carla.mendes@email.com', '(31) 97654-3210', '2025-11-10'),
('Daniel Oliveira', 'daniel.oliver@email.com', '(41) 96543-2109', '2025-11-12'),
('Elisa Santos', 'elisa.santos@email.com', '(51) 95432-1098', '2025-11-15');


INSERT INTO PEDIDOS (cliente_id, valor_total, data_pedido) VALUES
(1, 239.80, '2025-11-16 10:30:00'),
(3, 339.80, '2025-11-16 14:45:00'), 
(2, 309.80, '2025-11-17 09:15:00'), 
(4, 399.80, '2025-11-17 11:50:00'), 
(5, 329.80, '2025-11-17 13:00:00'); 

INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 49.90),    
(1, 3, 1, 189.90);   

INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(2, 3, 1, 189.90),   
(2, 9, 1, 149.90);  

INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(3, 5, 1, 199.90),  
(3, 10, 1, 119.90); 
INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(3, 5, 1, 199.90), 
(3, 6, 1, 89.90);   


INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(4, 7, 1, 159.90),  
(4, 8, 1, 249.90);  

INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(5, 2, 1, 129.90),
(5, 5, 1, 199.90);
