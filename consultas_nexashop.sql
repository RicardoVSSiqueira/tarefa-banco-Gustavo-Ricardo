USE ecommerce_nexashop;
SELECT
'clientes' AS tabela, COUNT(*) AS total FROM clientes
UNION ALL
SELECT
'produtos' AS tabela, COUNT(*) AS total FROM produtos
UNION ALL
SELECT
'pedidos' AS tabela, COUNT(*) AS total FROM pedidos
UNION ALL
SELECT
'avaliacoes' AS tabela, COUNT(*) AS total FROM avaliacoes;

/*
-- TAREFA 2.1

SELECT
	nome,
    cidade,
    estado,
    status
FROM
	clientes
WHERE
	status = 'ativo'
AND estado IN ('SC', 'PR', 'RS')
ORDER BY
	estado,
    nome;

-- TAREFA 2.2
    
SELECT 
	*
FROM
	clientes
WHERE
	nome like '%gustavo%';


-- TAREFA 2.3

SELECT
	nome,
    email AS 'e-mail',
    cidade,
    estado
FROM
	clientes
WHERE
	telefone IS NULL;
    
    
-- TAREFA 2.4

SELECT 
	*
FROM
	pedidos
WHERE
	(valor_total BETWEEN 100 AND 500)
AND status = 'Aprovado'
ORDER BY
	valor_total
DESC;

-- TAREFA 2.5

SELECT 
	nome,
    categoria,
    estoque
FROM
	produtos
WHERE
	estoque < 10
AND ativo IS TRUE
ORDER BY
	estoque;

-- TAREFA 2.6

SELECT 
	id,
    valor_total,
    cupom_desconto
FROM
	pedidos
WHERE
	cupom_desconto IS NOT NULL;
*/