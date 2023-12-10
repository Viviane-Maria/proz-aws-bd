DELIMITER //

CREATE PROCEDURE RelatorioDiario()
BEGIN

    SELECT 
        data_venda AS data_atual,
        SUM(quantidade) AS total_produtos_comprados
    FROM
        vendas
    WHERE
        DATE(data_venda) = CURRENT_DATE
    GROUP BY
        data_venda;

END //

DELIMITER ;

-- Executa procedure
CALL RelatorioDiario();