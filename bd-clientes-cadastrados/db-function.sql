DELIMITER //

CREATE FUNCTION SomarClientesCadastrados(data_consulta DATE) RETURNS INT
BEGIN
    DECLARE total_clientes INT;

    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE DATE(data_cadastro) = data_consulta;

    RETURN total_clientes;
END //

DELIMITER ;

-- Chama a função utilizando a data 05/12/2023 como exemplo
SELECT SomarClientesCadastrados('2023-12-05') AS total_clientes_no_dia;
