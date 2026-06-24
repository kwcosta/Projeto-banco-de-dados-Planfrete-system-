USE planfrete_db;

-- 1. Listar todos os fretes com o login do usuário que realizou o cadastro
SELECT f.nota_fiscal, f.local_estado, f.valor_negociado, f.veiculo_tipo, u.login 
FROM frete f
INNER JOIN usuario u ON f.id_usuario_cadastro = u.id_usuario;

-- 2. Relatório Analítico: Confronto do valor negociado com a média de mercado e cálculo da divergência
SELECT 
    f.nota_fiscal,
    f.local_estado,
    f.veiculo_tipo,
    f.valor_negociado,
    m.valor_medio AS valor_medio_mercado,
    (f.valor_negociado - m.valor_medio) AS divergencia,
    CASE 
        WHEN f.valor_negociado > m.valor_medio THEN 'Acima da Média'
        WHEN f.valor_negociado < m.valor_medio THEN 'Abaixo da Média'
        ELSE 'Dentro da Média'
    END AS status_custo
FROM frete f
INNER JOIN media_mercado m ON f.local_estado = m.local_estado AND f.veiculo_tipo = m.veiculo_tipo;