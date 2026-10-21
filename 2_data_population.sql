

INSERT INTO tb_teams (team_name, sla_target_hours) VALUES 
('Suporte Frontline Phone', 48), 
('Suporte Digital Chat/Email', 24);

-- Inserir Agentes únicos do log
INSERT INTO tb_agents VALUES 
('AGENT-101', 'Agente 101', 2), ('AGENT-102', 'Agente 102', 1), ('AGENT-103', 'Agente 103', 1),
('AGENT-104', 'Agente 104', 2), ('AGENT-105', 'Agente 105', 1), ('AGENT-106', 'Agente 106', 2),
('AGENT-107', 'Agente 107', 2), ('AGENT-108', 'Agente 108', 2), ('AGENT-109', 'Agente 109', 1),
('AGENT-110', 'Agente 110', 1), ('AGENT-111', 'Agente 111', 2), ('AGENT-112', 'Agente 112', 2),
('AGENT-113', 'Agente 113', 2), ('AGENT-114', 'Agente 114', 1), ('AGENT-115', 'Agente 115', 1),
('AGENT-116', 'Agente 116', 1), ('AGENT-117', 'Agente 117', 1), ('AGENT-118', 'Agente 118', 1),
('AGENT-119', 'Agente 119', 2), ('AGENT-120', 'Agente 120', 2), ('AGENT-121', 'Agente 121', 1),
('AGENT-122', 'Agente 122', 2), ('AGENT-123', 'Agente 123', 2), ('AGENT-124', 'Agente 124', 2),
('AGENT-125', 'Agente 125', 1);

-- Inserir Amostra de Clientes
INSERT INTO tb_customers VALUES 
('CUST-1005', 'Cliente 1005'), ('CUST-1012', 'Cliente 1012'), ('CUST-1013', 'Cliente 1013'), ('CUST-1016', 'Cliente 1016'),
('CUST-1031', 'Cliente 1031'), ('CUST-1035', 'Cliente 1035'), ('CUST-1078', 'Cliente 1078'), ('CUST-1121', 'Cliente 1121'),
('CUST-1142', 'Cliente 1142'), ('CUST-1158', 'Cliente 1158'), ('CUST-1176', 'Cliente 1176'), ('CUST-1185', 'Cliente 1185'),
('CUST-1194', 'Cliente 1194'), ('CUST-1198', 'Cliente 1198'), ('CUST-1214', 'Cliente 1214'), ('CUST-1222', 'Cliente 1222'),
('CUST-1249', 'Cliente 1249'), ('CUST-1250', 'Cliente 1250'), ('CUST-1098', 'Cliente 1098');

-- Inserir Catálogo de Produtos
INSERT INTO tb_products VALUES ('P101', 'Produto Alfa'), ('P102', 'Produto Beta'), ('P103', 'Produto Gama'), ('P201', 'Produto Delta');

-- Inserir Histórico do Log de Tickets (Comandos Individuais de Segurança)
INSERT INTO tb_tickets2 VALUES ('TKT-8001', 'CUST-1222', 'AGENT-121', 'P102', 'Phone', 'Urgent', 'Closed', '2023-11-22', '2023-11-26', 3.5, 85.0);
INSERT INTO tb_tickets2 VALUES ('TKT-8002', 'CUST-1078', 'AGENT-125', 'P103', 'Phone', 'Low', 'Open', '2026-09-12', NULL, NULL, NULL);
INSERT INTO tb_tickets2 VALUES ('TKT-8003', 'CUST-1249', 'AGENT-115', 'P102', 'Phone', 'High', 'Closed', '2023-11-29', '2023-12-07', 1.3, 176.8);
INSERT INTO tb_tickets2 VALUES ('TKT-8004', 'CUST-1214', 'AGENT-107', 'P201', 'Chat', 'Medium', 'In Progress', '2026-05-25', NULL, NULL, NULL);
INSERT INTO tb_tickets2 VALUES ('TKT-8005', 'CUST-1091', 'AGENT-106', 'P102', 'Email', 'Urgent', 'On Hold', '2025-02-14', NULL, NULL, NULL);
INSERT INTO tb_tickets2 VALUES ('TKT-8006', 'CUST-1121', 'AGENT-120', 'P101', 'Web Form', 'High', 'Resolved', '2026-08-21', '2026-09-01', 1.5, 246.0);
INSERT INTO tb_tickets2 VALUES ('TKT-8007', 'CUST-1185', 'AGENT-103', 'P103', 'Email', 'Medium', 'Open', '2024-07-09', NULL, NULL, NULL);
INSERT INTO tb_tickets2 VALUES ('TKT-8009', 'CUST-1162', 'AGENT-116', 'P201', 'Email', 'Low', 'Resolved', '2024-02-12', '2024-02-17', 2.9, 106.6);
INSERT INTO tb_tickets2 VALUES ('TKT-8011', 'CUST-1176', 'AGENT-125', 'P201', 'Phone', 'Low', 'Resolved', '2025-10-21', '2025-11-03', 0.3, 310.5);
INSERT INTO tb_tickets2 VALUES ('TKT-8015', 'CUST-1158', 'AGENT-107', 'P102', 'Email', 'Urgent', 'Closed', '2022-10-19', '2022-10-19', 3.7, NULL);
INSERT INTO tb_tickets2 VALUES ('TKT-8018', 'CUST-1039', 'AGENT-125', 'P102', 'Email', 'High', 'Closed', '2024-02-17', '2024-02-21', 3.8, 93.0);
INSERT INTO tb_tickets2 VALUES ('TKT-8019', 'CUST-1013', 'AGENT-117', 'P103', 'Phone', 'Medium', 'Resolved', '2022-10-29', '2022-11-09', 1.5, 253.0);
INSERT INTO tb_tickets2 VALUES ('TKT-8021', 'CUST-1021', 'AGENT-125', 'P103', 'Phone', 'Urgent', 'Closed', '2023-03-07', '2023-03-11', 2.9, 86.7);
INSERT INTO tb_tickets2 VALUES ('TKT-8024', 'CUST-1182', 'AGENT-120', 'P201', 'Web Form', 'High', 'Resolved', '2024-09-30', '2024-10-14', 3.7, 320.2);
INSERT INTO tb_tickets2 VALUES ('TKT-8026', 'CUST-1198', 'AGENT-110', 'P201', 'Email', 'High', 'Closed', '2023-02-22', '2023-02-26', 3.8, 88.4);
INSERT INTO tb_tickets2 VALUES ('TKT-8028', 'CUST-1035', 'AGENT-111', 'P101', 'Email', 'Urgent', 'Closed', '2023-03-29', '2023-04-07', 2.7, 197.9);
INSERT INTO tb_tickets2 VALUES ('TKT-8103', 'CUST-1156', 'AGENT-121', 'P103', 'Phone', 'Low', 'Closed', '2024-07-03', '2024-07-16', 2.7, 296.9);
INSERT INTO tb_tickets2 VALUES ('TKT-8104', 'CUST-1016', 'AGENT-113', 'P201', 'Web Form', 'Urgent', 'Resolved', '2025-04-28', '2025-05-12', 2.4, 327.1);
INSERT INTO tb_tickets2 VALUES ('TKT-8109', 'CUST-1098', 'AGENT-109', 'P201', 'Email', 'Urgent', 'Open', '2026-10-15', NULL, NULL, NULL);
