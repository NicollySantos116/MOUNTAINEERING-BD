CREATE VIEW Vw_Inventario_Completo AS
SELECT 
    pr.nome_produto, 
    c.nome_categoria, 
    pr.tamanho, 
    pr.cor, 
    pr.preco, 
    pr.quantidade_estoque
FROM 
    PRODUTOS pr
INNER JOIN 
    CATEGORIAS c ON pr.categoria_id = c.categoria_id;


CREATE VIEW Vw_Historico_De_Vendas AS
SELECT 
    p.data_pedido AS data_venda, 
    c.nome_cliente, 
    pr.nome_produto, 
    pr.tamanho, 
    pr.cor, 
    i.quantidade, 
    i.preco_unitario AS preco_unitario_na_venda
FROM 
    PEDIDOS p
INNER JOIN 
    CLIENTES c ON p.cliente_id = c.cliente_id
INNER JOIN 
    ITENS_PEDIDO i ON p.pedido_id = i.pedido_id
INNER JOIN 
    PRODUTOS pr ON i.produto_id = pr.produto_id;


SELECT * FROM Vw_Inventario_Completo;

SELECT * FROM Vw_Historico_De_Vendas;