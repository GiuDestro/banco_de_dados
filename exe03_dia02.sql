CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;
CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    dataentradaestoque DATE,
    preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);
SELECT * FROM tb_produtos;
INSERT INTO tb_produtos(nome, quantidade, dataentradaestoque, preco) 
VALUES ("Algodão",56, "2024-01-05", 25.00),
("Kit Shampoo + Condic Dove",78, "2023-12-15", 51.00),
("Inalador portátil",50, "2023-10-20", 230.00),
("Pinça",200, "2024-02-13", 18.00),
("Dipirona",1500, "2023-11-25", 5.00),
("Máscara de hidratação Lola",200, "2024-04-02", 60.00),
("Ibuprofeno",2000, "2024-03-29", 10.00),
("Kit protetor solar 60fps",88, "2024-01-31", 79.00)
;
 CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT,
    setor VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
SELECT * FROM tb_categorias;
INSERT INTO tb_categorias (setor) 
VALUES ("Medicamentos"),
("Perfumaria"),
("Cabelo"),
("Pele"),
("Outros");

ALTER TABLE tb_produtos ADD categoriaid BIGINT;
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id);

UPDATE tb_produtos SET categoriaid = 5 WHERE id = 1;
UPDATE tb_produtos SET categoriaid = 3 WHERE id = 2;
UPDATE tb_produtos SET categoriaid = 5 WHERE id = 3;
UPDATE tb_produtos SET categoriaid = 2 WHERE id = 4;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 5;
UPDATE tb_produtos SET categoriaid = 3 WHERE id = 6;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 7;
UPDATE tb_produtos SET categoriaid = 4 WHERE id = 8;

SELECT * FROM tb_produtos;

-- produtos de valor maior que 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- produtos de valor entre 5,00 e 60,00
SELECT * FROM tb_produtos WHERE preco >= 5.00 AND preco <= 60.00;

-- todos os produtos que contenham a letra "c"
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

-- inner join
SELECT nome, preco, quantidade, tb_categorias.setor FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoriaid = tb_categorias.id;

-- trazendo só a categoria "cabelo"
SELECT tb_categorias.setor, 
       COUNT(tb_produtos.id) AS total_produtos, 
       AVG(tb_produtos.preco) AS preco_medio, 
       SUM(tb_produtos.quantidade) AS quantidade_total
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.setor = 'Cabelo'
GROUP BY tb_categorias.setor;

