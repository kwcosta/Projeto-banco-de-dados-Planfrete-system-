USE planfrete_db;

-- Inserção de Usuários para Teste
INSERT INTO usuario (login, senha) VALUES 
('kevin.campos', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
('admin.logistica', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- Carga da Tabela de Médias de Mercado
INSERT INTO media_mercado (local_estado, veiculo_tipo, valor_medio) VALUES
('RJ', 'TRUCK', 1500.00),
('RJ', 'CARRETA', 2500.00),
('SP', 'TRUCK', 1800.00),
('SP', 'CARRETA', 3200.00),
('MG', 'TRUCK', 1600.00),
('MG', 'CARRETA', 2900.00),
('ES', 'TRUCK', 1400.00),
('ES', 'CARRETA', 2600.00);

-- Transação Segura para Cadastro de Frete
START TRANSACTION;
INSERT INTO frete (nota_fiscal, local_estado, valor_negociado, veiculo_tipo, id_usuario_cadastro)
VALUES ('NF-100245', 'SP', 3100.00, 'CARRETA', 1);
COMMIT;
