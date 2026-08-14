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

/* BLOCO 1 - Reconhecimento do banco */

-- TAREFA 1.1

SELECT *
FROM clientes
LIMIT 10;

SELECT *
FROM produtos
LIMIT 10;

SELECT *
FROM pedidos
LIMIT 10;

SELECT *
FROM avaliacoes
LIMIT 10;

-- TAREFA 1.2

SELECT 
	nome as nome_produtos,
    categoria as todas_categorias,
    marca as marca_produtos, 
    preco as "Valor (R$)",
    estoque as estoque_total
from produtos;

-- TAREFA 1.3

SELECT  distinct categoria
from produtos
order by categoria asc;

-- TAREFA 1.4

SELECT distinct forma_pagamento
from pedidos;

SELECT distinct canal_venda
from pedidos;

