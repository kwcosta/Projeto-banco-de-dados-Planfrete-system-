-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS planfrete_db;
USE planfrete_db;

-- Tabela de Usuários
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_usuario)
);

-- Tabela de Fretes
CREATE TABLE IF NOT EXISTS frete (
    id_frete INT AUTO_INCREMENT,
    nota_fiscal VARCHAR(20) NOT NULL UNIQUE,
    local_estado CHAR(2) NOT NULL,
    valor_negociado DECIMAL(10,2) NOT NULL,
    veiculo_tipo VARCHAR(20) NOT NULL,
    id_usuario_cadastro INT NOT NULL,
    PRIMARY KEY (id_frete),
    FOREIGN KEY (id_usuario_cadastro) REFERENCES usuario(id_usuario)
);

-- Tabela de Valores Médios de Mercado (Parametrização)
CREATE TABLE IF NOT EXISTS media_mercado (
    id_media INT AUTO_INCREMENT,
    local_estado CHAR(2) NOT NULL,
    veiculo_tipo VARCHAR(20) NOT NULL,
    valor_medio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_media),
    UNIQUE KEY uq_estado_veiculo (local_estado, veiculo_tipo)
);