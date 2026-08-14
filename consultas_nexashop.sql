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

/*
Contexto: O time comercial quer priorizar uma campanha regional.
Tarefa: Liste nome, cidade, estado e status dos clientes ativos dos estados SC, PR e RS, ordenando por
estado e depois por nome.
Evidência esperada: WHERE com status = 'Ativo', IN para os estados, AND e ORDER BY em duas
colunas.
*/

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
/*
Contexto: O atendimento recebe do cliente apenas parte do nome.
Tarefa: Crie uma consulta que encontre clientes cujo nome contenha um termo escolhido pela dupla.
Evidência esperada: Uso correto de LIKE com o caractere %.
*/
SELECT 
	*
FROM
	clientes
WHERE
	nome like '%gustavo%';


-- TAREFA 2.3
/*
Contexto: Uma campanha de atualização cadastral por e-mail será disparada para quem não tem
telefone informado.
Tarefa: Liste nome, e-mail, cidade e estado dos clientes com telefone nulo.
Evidência esperada: Uso de IS NULL e seleção objetiva de colunas.
*/
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
/*
Contexto: A diretoria quer entender o perfil de pedidos "de ticket médio" — nem os menores, nem os
maiores.
Tarefa: Liste os pedidos aprovados com valor_total entre R$ 100 e R$ 500, ordenados do maior para o
menor valor.
Evidência esperada: BETWEEN combinado com filtro de status e ORDER BY DESC.
*/
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
/*
Contexto: O time de compras precisa saber quais produtos ativos estão com estoque crítico.
Tarefa: Liste nome, categoria e estoque dos produtos ativos com estoque menor que 10, ordenados
do menor estoque para o maior.
Evidência esperada: WHERE com duas condições unidas por AND e ORDER BY ascendente.
*/
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
/*
Contexto: O marketing quer avaliar quantos pedidos usaram algum cupom de desconto.
Tarefa: Liste id, valor_total e cupom_desconto dos pedidos que tiveram cupom aplicado (não nulo).
Evidência esperada: Uso correto de IS NOT NULL.
*/
SELECT 
	id,
    valor_total,
    cupom_desconto
FROM
	pedidos
WHERE
	cupom_desconto IS NOT NULL;
    

-- TAREFA 5.1
/*
Tarefa: Entre os pedidos aprovados, mostre canal_venda, forma_pagamento, quantidade de pedidos
e faturamento, considerando apenas combinações com pelo menos 200 pedidos. Ordene pelo
faturamento e mostre somente as 5 primeiras combinações.
Evidência esperada: WHERE + GROUP BY em duas colunas + HAVING + ORDER BY + LIMIT, todos na
mesma consulta.
*/
SELECT
    canal_venda,
    forma_pagamento,
    COUNT(*)         AS quantidade_pedidos,
    SUM(valor_total) AS faturamento
FROM pedidos
WHERE status = 'Aprovado'
GROUP BY canal_venda, forma_pagamento
HAVING COUNT(*) >= 200
ORDER BY faturamento DESC
LIMIT 5;

-- TAREFA 5.2
/*
Tarefa: Entre os produtos ativos, mostre categoria, quantidade de produtos e preço médio, apenas
para categorias cujo preço médio seja superior a R$ 300, ordenado do maior para o menor preço
médio.
Evidência esperada: WHERE + GROUP BY + HAVING com função agregadora (AVG) + ORDER BY.
*/
SELECT
    categoria,
    COUNT(*)               AS quantidade_produtos,
    ROUND(AVG(preco), 2)   AS preco_medio
FROM produtos
WHERE ativo = 1
GROUP BY categoria
HAVING AVG(preco) > 300
ORDER BY preco_medio DESC;


-- TAREFA 5.3
/*
Contexto: Em uma reunião, um gestor da NexaShop afirmou que "pedidos pagos por boleto parecem
cancelar mais". Isso é uma hipótese, não um fato — é trabalho da dupla confirmar ou refutar com
dados, sem aceitar a afirmação apenas porque veio de um gestor.
Tarefa: Construa uma consulta que calcule a taxa de cancelamento (percentual de pedidos com status
= 'Cancelado') para cada forma de pagamento, usando a mesma técnica da tarefa 4.3.
Evidência esperada: Consulta correta (GROUP BY forma_pagamento + AVG(CASE...)) e, no relatório,
um parágrafo estruturado no formato sintoma → evidência → hipótese → validação → conclusão,
indicando se a hipótese do gestor se confirma ou não.
*/
SELECT
    forma_pagamento,
    COUNT(*)                                                  AS total_pedidos,
    SUM(CASE WHEN status = 'Cancelado' THEN 1 ELSE 0 END)     AS pedidos_cancelados,
    ROUND(AVG(CASE WHEN status = 'Cancelado' THEN 1 ELSE 0 END) * 100, 2) AS taxa_cancelamento_pct
FROM pedidos
GROUP BY forma_pagamento
ORDER BY taxa_cancelamento_pct DESC;