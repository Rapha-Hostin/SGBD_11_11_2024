CREATE TABLE pessoas (
    id SERIAL PRIMARY KEY,          
    nome VARCHAR(100) NOT NULL,      
    data_nascimento DATE,            
    email VARCHAR(255),              
    telefone VARCHAR(15)             
);

SELECT * from pessoas

INSERT into pessoas( nome, email, telefone)
VALUES ('Patyricia','rapha.alves74@gmail.com', '988502409');

--função para o trigger
CREATE OR REPLACE FUNCTION verificar_data_nascimento()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o campo 'data_nascimento' é nulo
    IF NEW.data_nascimento IS NULL THEN
        RAISE EXCEPTION 'Atualize sua data de nascimento';
    END IF;
    -- Retorna a linha, permitindo que a operação continue
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Criar o trigger que chama a função
CREATE TRIGGER trigger_verificar_data_nascimento
BEFORE INSERT OR UPDATE ON pessoas
FOR EACH ROW
EXECUTE FUNCTION verificar_data_nascimento();