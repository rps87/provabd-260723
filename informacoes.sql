CREATE DATABASE IF NOT EXISTS conveniencia;

USE conveniencia;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS lanches (
	idLanche INT(11) NOT NULL PRIMARY KEY,
        nomeLanche VARCHAR(50) NOT NULL,
	descricao VARCHAR(150) NOT NULL,
	preco FLOAT(11) NOT NULL -- Exemplo: 12.99 
);

CREATE TABLE IF NOT EXISTS pedidos (
        idPedido INT(11) NOT NULL PRIMARY KEY,
        idLanche INT(11) NOT NULL,
        quantidade INT(11) NOT NULL,
        valorPedido FLOAT(11) NOT NULL, -- Exemplo: 12.99
        observacao VARCHAR(150) NOT NULL,
        tipoRefri INT(11) NOT NULL, -- Exemplo: [1]Coca [2]Sprite [3]Fanta Uva
        dataPedido VARCHAR(15) NOT NULL, -- Exemplo: 12\07\2023
        estadoPedido INT(11) NOT NULL, -- [1]Solicitado Pelo Cliente [2]Em Preparação [3]Liberado Para entrega [4]Cancelado
        FOREIGN KEY (idLanche) REFERENCES lanches(idLanche)
);

CREATE TABLE IF NOT EXISTS entregas (
        idEntrega INT(11) NOT NULL PRIMARY KEY,
        idPedido INT(11) NOT NULL,
        endereco VARCHAR(50) NOT NULL,
        nomeCli VARCHAR(50) NOT NULL,
        telCli VARCHAR(10) NOT NULL, -- Exemplo: 95454-3232
        estadoPedido INT(11) NOT NULL, -- [1]Aguardando Motoboy [2]Entregue [3]Cancelada 
        FOREIGN KEY (idPedido) REFERENCES pedidos(idPedido)
);

INSERT INTO lanches (idLanche,nomeLanche,descricao,preco) VALUES
        (1, 'Combo 1', 'X-Burguer + Batata Frita + Refri Lata', 9.99),
        (2, 'Combo 2', 'X-Salada + Batata Frita + Refri Lata', 12.99),
        (3, 'Combo 3', 'X-Egg + Batata Frita + Refri Lata', 14.99),
        (4, 'Combo 4', 'X-Bacon + Batata Frita + Refri Lata', 16.99),
        (5, 'Combo 5', 'X-Tudo + Batata Frita + Refri Lata', 20.99),
        (6, 'Combo 6', 'X-Fome + Batata Frita + Refri Lata', 24.99);

INSERT INTO pedidos (idPedido,idLanche,quantidade,valorPedido,observacao,tipoRefri,dataPedido,estadoPedido) VALUES
        (1,1,1,9.99,'Batata sem sal',1,'03/07/2023',3),
        (2,2,1,12.99,'Sem Alface',2,'03/07/2023',3),
        (3,3,1,14.99,'Batata sem sal',1,'03/07/2023',3),
        (4,4,1,16.99,'Batata com sal',3,'04/07/2023',4),
        (5,5,1,20.99,'Sem Alface',1,'04/07/2023',3),
        (6,6,1,24.99,'Batata com sal',1,'04/07/2023',3),
        (7,1,1,9.99,'Sem Queijo',1,'05/07/2023',1),
        (8,2,1,12.99,'Sem Alface',2,'05/07/2023',1),
        (9,3,1,14.99,'Batata com sal',1,'05/07/2023',3),
        (10,4,1,16.99,'Sem Alface',2,'05/07/2023',4),
        (11,5,1,20.99,'Sem Batata Palha',1,'05/07/2023',2),
        (12,6,1,24.99,'Sem Alface',3,'05/07/2023',2),
        (13,1,1,9.99,'Batata sem sal',3,'05/07/2023',3),
        (14,2,1,12.99,'Batata com sal',1,'05/07/2023',2),
        (15,3,1,14.99,'Batata com sal',2,'05/07/2023',4),
        (16,4,1,16.99,'Sem Alface',1,'05/07/2023',3),
        (17,5,1,20.99,'Sem Alface',2,'05/07/2023',2),
        (18,6,1,24.99,'Sem Alface',3,'05/07/2023',2);

INSERT INTO entregas (idEntrega,idPedido, endereco, nomeCli, telCli, estadoPedido) VALUES
        (101,1,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (102,2,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (103,3,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (104,4,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (105,5,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',1),
        (106,6,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (107,7,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (108,8,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (109,9,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (110,10,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',3),
        (111,11,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (112,12,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (113,13,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (114,14,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (115,15,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',3),
        (116,16,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (117,17,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',2),
        (118,18,'Rua Ali, 200, Bairro A', 'Antonio', '90101-0101',1);