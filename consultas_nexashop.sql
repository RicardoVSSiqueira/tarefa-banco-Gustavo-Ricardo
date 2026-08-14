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

/* Bloco 3 — Indicadores agregados */

/* TAREFA 3.1 */

SELECT 
    COUNT(*) AS quantidade_pedidos,
    ROUND(AVG(valor_total), 2) AS ticket_medio,
    MIN(valor_total) AS menor_valor,
    MAX(valor_total) AS maior_valor
FROM pedidos
WHERE status = 'aprovado';


/* TAREFA 3.2 */

SELECT forma_pagamento, SUM(valor_total) as faturamento_total
from pedidos
where status = 'aprovado'
group by forma_pagamento
order by faturamento_total desc;

/* TAREFA 3.3 */

SELECT estado, count(*) as quantidade_por_estado
from clientes
group by estado
order by quantidade_por_estado desc;

/* TAREFA 3.4 */

SELECT estado, count(*) estados_relevantes
from clientes
group by estado
having count(*) > 200
order by estados_relevantes;

/* TAREFA 3.5 */

SELECT segmento, AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade_media
FROM clientes
GROUP BY segmento;

/* TAREFA 3.6 */

SELECT categoria, sum(preco*estoque) as calculo_total
from produtos
WHERE ativo = 1
GROUP BY categoria
order by calculo_total desc;

/* Bloco 4 — Classificação com CASE e regras de negócio */

/* TAREFA 4.1 */

SELECT nota, 
	   case
		   when nota = 5 then 'Excelente'
           when nota = 4 then 'Boa'
           when nota = 3 then 'Regular'
           WHEN nota = 1 OR nota = 2 THEN 'Insatisfatória'
end as classificação
from avaliacoes;