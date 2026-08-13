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
    nome