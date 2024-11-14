CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO clientes (nome, email, data_cadastro) VALUES
('João', 'rprprp@teste.com', '2024-11-02'),
('Pedro', 'rprprp@teste.com', '2024-11-02'),
('Lucas', 'rprprp@teste.com', '2024-11-03')

select * from clientes

CREATE OR REPLACE FUNCTION contar_clientes_por_dia(data_especifica DATE)
RETURNS INTEGER AS $$
DECLARE
  total_clientes INTEGER;
BEGIN
  -- Contar os clientes cadastrados no dia informado
  SELECT COUNT(*) INTO total_clientes
  FROM clientes
  WHERE data_cadastro::DATE = data_especifica;

  -- Retornar o número de clientes
  RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;


SELECT contar_clientes_por_dia('2024-11-01');
 