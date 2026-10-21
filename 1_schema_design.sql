-- =========================================================================
-- PASSO 1: CRIAÇÃO DA ESTRUTURA RELACIONAL (DDL)
-- =========================================================================

CREATE TABLE tb_teams (
    id_team INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL,
    sla_target_hours INT NOT NULL
);

CREATE TABLE tb_customers (
    id_customer VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE tb_products (
    id_product VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

CREATE TABLE tb_agents (
    id_agent VARCHAR(20) PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    id_team INT,
    FOREIGN KEY (id_team) REFERENCES tb_teams(id_team)
);

CREATE TABLE tb_tickets2 (
    id_ticket VARCHAR(20) PRIMARY KEY,
    id_customer VARCHAR(20),
    id_agent VARCHAR(20),
    id_product VARCHAR(20),
    channel VARCHAR(30),
    priority VARCHAR(20),
    status VARCHAR(30),
    created_at DATE,
    resolved_at DATE,
    csat DECIMAL(3, 1),
    resolution_time_hours DECIMAL(6, 1),
    FOREIGN KEY (id_customer) REFERENCES tb_customers(id_customer),
    FOREIGN KEY (id_agent) REFERENCES tb_agents(id_agent),
    FOREIGN KEY (id_product) REFERENCES tb_products(id_product)
);
