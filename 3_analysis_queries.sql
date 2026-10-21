
SELECT 
    t.team_name AS nome_equipa,
    COUNT(tk.id_ticket) AS total_tickets,
    ROUND((COUNT(tk.id_ticket) / (SELECT COUNT(*) FROM tb_tickets2)) * 100, 2) AS percentual_do_volume
FROM tb_tickets2 tk
INNER JOIN tb_agents a ON tk.id_agent = a.id_agent
INNER JOIN tb_teams t ON a.id_team = t.id_team
GROUP BY t.id_team, t.team_name
ORDER BY total_tickets DESC;

-- Q2: Ranking de Agentes com maior CSAT Médio por Equipa (CTEs & Window Functions)
WITH cte_agente_csat AS (
    SELECT 
        a.agent_name AS nome_agente,
        t.team_name AS nome_equipa,
        COUNT(tk.id_ticket) AS tickets_avaliados,
        AVG(tk.csat) AS csat_medio
    FROM tb_tickets2 tk
    INNER JOIN tb_agents a ON tk.id_agent = a.id_agent
    INNER JOIN tb_teams t ON a.id_team = t.id_team
    WHERE tk.csat IS NOT NULL
    GROUP BY a.id_agent, a.agent_name, t.team_name
)
SELECT 
    nome_agente,
    nome_equipa,
    tickets_avaliados,
    ROUND(csat_medio, 2) AS csat_medio,
    DENSE_RANK() OVER(PARTITION BY nome_equipa ORDER BY csat_medio DESC) AS ranking_no_time
FROM cte_agente_csat
ORDER BY csat_medio DESC;

-- Q3: Tempo de Resolução por Tipo de Produto
SELECT 
    p.product_name AS produto,
    COUNT(tk.id_ticket) AS total_tickets_resolvidos,
    ROUND(AVG(tk.resolution_time_hours), 2) AS tempo_medio_resolucao_horas
FROM tb_tickets2 tk
INNER JOIN tb_products p ON tk.id_product = p.id_product
WHERE tk.status IN ('Closed', 'Resolved') AND tk.resolution_time_hours IS NOT NULL
GROUP BY p.id_product, p.product_name
ORDER BY tempo_medio_resolucao_horas DESC;

-- Q4: Evolução Mensal do Volume de Atendimento e Taxa de Conclusão
SELECT 
    DATE_FORMAT(created_at, '%Y-%m') AS ano_mes,
    COUNT(id_ticket) AS volume_tickets,
    ROUND((SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END) / COUNT(id_ticket)) * 100, 2) AS taxa_conclusao_percentual
FROM tb_tickets2
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY ano_mes ASC;

-- Q5: Performance de Cumprimento de Metas de SLA por Equipa
SELECT 
    t.team_name AS nome_equipa,
    t.sla_target_hours AS meta_sla_horas,
    COUNT(tk.id_ticket) AS total_tickets_fechados,
    ROUND((SUM(CASE WHEN tk.resolution_time_hours <= t.sla_target_hours THEN 1 ELSE 0 END) / COUNT(tk.id_ticket)) * 100, 2) AS taxa_cumprimento_sla
FROM tb_tickets2 tk
INNER JOIN tb_agents a ON tk.id_agent = a.id_agent
INNER JOIN tb_teams t ON a.id_team = t.id_team
WHERE tk.status IN ('Closed', 'Resolved') AND tk.resolution_time_hours IS NOT NULL
GROUP BY t.id_team, t.team_name, t.sla_target_hours;

-- Q6: Criação de VIEW Analítica para Monitorização de Casos Retidos (On Hold)
CREATE OR REPLACE VIEW vw_escalamento_produtos AS
SELECT 
    p.product_name AS produto,
    COUNT(tk.id_ticket) AS total_tickets,
    SUM(CASE WHEN tk.status = 'On Hold' THEN 1 ELSE 0 END) AS total_retidos,
    ROUND((SUM(CASE WHEN tk.status = 'On Hold' THEN 1 ELSE 0 END) / COUNT(tk.id_ticket)) * 100, 2) AS taxa_retencao_percentual
FROM tb_tickets2 tk
INNER JOIN tb_products p ON tk.id_product = p.id_product
GROUP BY p.id_product, p.product_name;

-- Q7: Impacto do Tempo de Atendimento na Satisfação do Cliente (CSAT)
SELECT 
    CASE 
        WHEN resolution_time_hours <= 24 THEN '1. Rápido (Até 24h)'
        WHEN resolution_time_hours > 24 AND resolution_time_hours <= 72 THEN '2. Aceitável (24h a 72h)'
        ELSE '3. Lento (Mais de 72h)'
    END AS faixa_tempo,
    COUNT(id_ticket) AS quantidade_tickets,
    ROUND(AVG(csat), 2) AS media_csat
FROM tb_tickets2
WHERE status IN ('Closed', 'Resolved') AND resolution_time_hours IS NOT NULL AND csat IS NOT NULL
GROUP BY 1
ORDER BY faixa_tempo ASC;
