CREATE DATABASE db_rh;
USE db_rh;
CREATE TABLE tb_colaboradores(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(6,2) NOT NULL,
    dataadmissao DATE,
    cargo VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
SELECT * FROM tb_colaboradores;
INSERT INTO tb_colaboradores(nome, salario, dataadmissao, cargo) 
VALUES ("Paula Silva",3500.00,"2017-06-01","Assistente Jurídico"),
("Victor Pereira",9000.00,"2019-09-09","Desenvolver Web Jr"),
("Luma Costa",3000.00,"2020-02-10","Analista de Atendimento"),
("Flavio Nonato",8000.00,"2023-05-08","Anlista Jurídico Pleno"),
("Sandra Hirota",9999.00,"2015-12-20","Advogada Pleno");

-- alterando salario da colaboradora
UPDATE tb_colaboradores SET salario = 1500.00 WHERE id = 1;

-- mostrando todos os colaboradores
SELECT * FROM tb_colaboradores;

-- mostrando colaboradores que recebam mais que 2k
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

-- mostrando colaboradores que recebam menos que 2k
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;