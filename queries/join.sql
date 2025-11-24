SELECT 
    c.nome_cliente, 
    p.data_pedido, 
    i.quantidade, 
    pr.nome_produto, 
    pr.tamanho, 
    pr.cor
FROM 
    PEDIDOS p
INNER JOIN 
    CLIENTES c ON p.cliente_id = c.cliente_id
INNER JOIN 
    ITENS_PEDIDO i ON p.pedido_id = i.pedido_id
INNER JOIN 
    PRODUTOS pr ON i.produto_id = pr.produto_id
WHERE 
    p.pedido_id = X;


SELECT 
    pr.nome_produto, 
    pr.quantidade_estoque, 
    c.nome_categoria
FROM 
    PRODUTOS pr
INNER JOIN 
    CATEGORIAS c ON pr.categoria_id = c.categoria_id
WHERE 
    pr.quantidade_estoque < 10
    AND c.categoria_id = 3;


SELECT 
    c.nome_cliente, 
    p.data_pedido
FROM 
    CLIENTES c
LEFT JOIN 
    PEDIDOS p ON c.cliente_id = p.cliente_id
ORDER BY 
    c.nome_cliente, p.data_pedido;