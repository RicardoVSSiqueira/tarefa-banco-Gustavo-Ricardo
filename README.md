# Tarefa de Banco de Dados — NexaShop

Repositório com a resolução da atividade de SQL baseada no banco de dados
fictício da **NexaShop**, um e-commerce com as tabelas `clientes`, `produtos`,
`pedidos` e `avaliacoes`. A atividade é dividida em blocos de consultas que
evoluem de reconhecimento simples do banco até indicadores agregados e
validação de hipóteses de negócio.

## Autores

- Gustavo Do Espirito Santo
- Ricardo Vinicius de Souza Siqueira

## Estrutura do repositório

```
.
├── consultas_nexashop.sql   # Todas as consultas SQL da atividade, organizadas por bloco/tarefa
├── prints/                  # Capturas de tela com a evidência de execução de cada consulta
└── README.md
```

### `consultas_nexashop.sql`

Contém todas as queries desenvolvidas para a tarefa, comentadas com o
contexto e o enunciado de cada exercício, organizadas nos seguintes blocos:

- **Bloco 1 — Reconhecimento do banco**: exploração inicial das tabelas
  (`SELECT *`, colunas específicas, valores distintos de categoria, forma de
  pagamento e canal de venda).
- **Bloco 2 — Filtros com `WHERE`**: consultas com `IN`, `LIKE`, `IS NULL`,
  `IS NOT NULL`, `BETWEEN` e `ORDER BY` para responder a demandas de
  marketing, atendimento e compras.
- **Bloco 3 — Indicadores agregados**: uso de `COUNT`, `SUM`, `AVG`, `MIN`,
  `MAX`, `GROUP BY` e `HAVING` para gerar métricas de pedidos, clientes e
  estoque por categoria/estado.
- **Bloco 4 — Classificação com `CASE`**: regras de negócio para classificar
  avaliações, calcular taxa de aprovação de pedidos e segmentar clientes por
  tempo de cadastro.
- **Bloco 5 — Consultas combinadas**: consultas mais completas unindo
  `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY` e `LIMIT` na mesma query,
  incluindo a validação de uma hipótese de negócio (taxa de cancelamento por
  forma de pagamento).

### `prints/`

Imagens com o resultado da execução de cada consulta no banco, nomeadas de
acordo com o número da tarefa correspondente (ex.: `2.3.png` é a evidência da
Tarefa 2.3), servindo como comprovação do funcionamento das queries do
arquivo `consultas_nexashop.sql`.
