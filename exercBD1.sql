DROP TABLE vendasProduto;
DROP TABLE vendas;
DROP TABLE tamanho;
DROP TABLE produto;
DROP TABLE categoria;
DROP TABLE condPagto;
DROP TABLE vendedor;
DROP TABLE cliente;

DROP VIEW retornaNome 
DROP VIEW retornaProdutosVendidos 
DROP VIEW retornaVendas 
DROP VIEW retornaProduto 


/*CREATE*/
    CREATE TABLE cliente (
        cod SERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        dataNasc DATE,
        cpf_cnpj VARCHAR(14) NOT NULL,
        endereco VARCHAR(60) NOT NULL,
        bairro VARCHAR(40) NOT NULL,
        cidade VARCHAR(40) NOT NULL,
        uf CHAR(2) NOT NULL,
        complemento VARCHAR(40),
        telefone VARCHAR(15),
        email VARCHAR(50) NOT NULL 
    );

    CREATE TABLE vendedor(
        cod SERIAL PRIMARY KEY, 
        nome VARCHAR(50) NOT NULL,
        login VARCHAR(20) NOT NULL,
        senha VARCHAR(15) NOT NULL,
        percComis NUMERIC(4,2) NOT NULL
    );
        

    CREATE TABLE condPagto(
        cod SERIAL PRIMARY KEY,
        descricao VARCHAR(35)
    );

  
    CREATE TABLE categoria(
        cod SERIAL PRIMARY KEY,
        categoria VARCHAR(40) NOT NULL
    );

    CREATE TABLE produto(
        cod SERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        preco NUMERIC(12,2) NOT NULL,
        codCategoria INTEGER REFERENCES categoria(cod)
    );

    CREATE TABLE tamanho(
        cod SERIAL PRIMARY KEY,
        tamanho VARCHAR(15) NOT NULL,
        estoque INTEGER NOT NULL,
        codProduto INTEGER REFERENCES produto(cod)
    );
    
    CREATE TABLE vendas(
        cod SERIAL PRIMARY KEY,
        data DATE,
        codVendedor INTEGER REFERENCES vendedor(cod),
        codCondPagto INTEGER REFERENCES condPagto(cod),
        codCliente INTEGER REFERENCES cliente(cod)
    );

    CREATE TABLE vendasProduto(
        codVendas INTEGER REFERENCES vendas(cod),
        codProduto INTEGER REFERENCES produto(cod),
        descontO NUMERIC(5,2),
        qtde INTEGER NOT NULL,
        PRIMARY KEY(codVendas, codProduto)
    );

/*INSERT*/
    INSERT INTO cliente (nome, dataNasc, cpf_cnpj, endereco, bairro, cidade, uf, complemento, telefone, email)
    VALUES  
        ('Ana Silva', '1985-03-15', '123.456.789-01', 'Rua da Esperança, 123', 'Centro', 'São Paulo', 'SP', 'Apto 101', '(11) 9876-5432', 'ana.silva@email.com'),
        ('Carlos Oliveira', '1990-08-22', '987.654.321-09', 'Av. dos Girassóis, 456', 'Jardins', 'Rio de Janeiro', 'RJ', NULL, '(21) 1234-5678', 'carlos.oliveira@email.com'),
        ('Mariana Santos', '1982-05-10', '456.789.012-34', 'Rua das Acácias, 789', 'Vila Nova', 'Belo Horizonte', 'MG', 'Casa Verde', '(31) 3456-7890', 'mariana.santos@email.com'),
        ('Rafael Pereira', '1994-12-05', '234.567.890-12', 'Av. das Palmeiras, 987', 'Centro', 'Salvador', 'BA', NULL, '(71) 8901-2345', 'rafael.pereira@email.com'),
        ('Larissa Lima', '1988-06-18', '876.543.210-98', 'Rua das Violetas, 654', 'Jardim América', 'Porto Alegre', 'RS', 'Sobrado Amarelo', '(51) 6789-0123', 'larissa.lima@email.com'),
        ('Lucas Costa', '1996-09-25', '765.432.109-87', 'Av. das Rosas, 321', 'Bairro Novo', 'Florianópolis', 'SC', NULL, '(47) 3210-9876', 'lucas.costa@email.com'),
        ('Fernando Rocha', '1980-02-28', '543.210.987-65', 'Rua dos Lírios, 159', 'Jardim Botânico', 'Curitiba', 'PR', 'Apto 202', '(41) 8765-4321', 'fernando.rocha@email.com'),
        ('Camila Pereira', '1992-07-14', '321.098.765-43', 'Av. das Orquídeas, 753', 'Bairro Recife', 'Recife', 'PE', NULL, '(81) 9876-5432', 'camila.pereira@email.com'),
        ('José Oliveira', '1987-11-30', '210.987.654-32', 'Rua dos Cravos, 246', 'Centro', 'Fortaleza', 'CE', 'Casa Azul', '(85) 4321-0987', 'jose.oliveira@email.com'),
        ('Patrícia Santos', '1993-04-17', '109.876.543-21', 'Av. dos Ipês, 987', 'Jardim Tropical', 'Goiânia', 'GO', NULL, '(62) 8765-4321', 'patricia.santos@email.com');

    INSERT INTO vendedor (nome, login, senha, percComis)
    VALUES 
        ('Lucas Silva', 'lucas.vend', 'V3nD@#r123', 0.1),
        ('Amanda Oliveira', 'amanda_vend', 'Vend@456Xyz', 0.08),
        ('Marcos Pereira', 'marcos_vend', 'S@gr3dO_789', 0.12),
        ('Juliana Santos', 'juliana_vend', 'V3nd3d0r!123', 0.15),
        ('Rodrigo Lima', 'rodrigo_vend', 'S3nh@S3gura', 0.09),
        ('Isabela Costa', 'isabela_vend', 'V3nd4s@123', 0.11),
        ('Renato Rocha', 'renato_vend', 'V3nd@S3gura', 0.14),
        ('Camila Pereira', 'camila_vend', 'S3nh@C4m1la', 0.1),
        ('Alex Oliveira', 'alex_vend', 'V3nd@456ABC', 0.08),
        ('Daniela Santos', 'daniela_vend', 'S3gr3d0D@789', 0.12);

    INSERT INTO condPagto (descricao)
    VALUES 
        ('Pagamento à vista'),
        ('Parcelado em 3 vezes'),
        ('Parcelado em 6 vezes sem juros'),
        ('Parcelado em 12 vezes com juros'),
        ('Pagamento na entrega'),
        ('Boleto bancário'),
        ('Cartão de crédito'),
        ('Transferência bancária'),
        ('Pix'),
        ('Cheque pré-datado');

    INSERT INTO categoria (categoria) 
    VALUES 
        ('Eletrônicos'),
        ('Roupas'),
        ('Calçados'),
        ('Móveis'),
        ('Alimentos'),
        ('Acessórios'),
        ('Cosméticos'),
        ('Livros'),
        ('Brinquedos'),
        ('Esportes');

    INSERT INTO produto (nome, preco, codCategoria) 
    VALUES 
        ('Smartphone Modelo A52', 899.99, 1),
        ('Jaqueta de Couro', 129.99, 2),
        ('Tênis de Corrida', 89.99, 3),
        ('Sofá Reclinável', 599.99, 4),
        ('Arroz Integral ', 15.99, 5),
        ('Relógio Fashion', 59.99, 6),
        ('Kit de Maquiagem Profissional', 79.99, 7),
        ('Livro "Aventuras Fantásticas"', 19.99, 8),
        ('Carrinho de Controle Remoto', 39.99, 9),
        ('Bola de Basquete', 24.99, 10),
        ('Notebook Ultrafino', 1299.99, 1),
        ('Camisa Polo', 39.99, 2),
        ('Sapato Social', 69.99, 3),
        ('Cama King Size', 899.99, 4),
        ('Azeite de Oliva Extra Virgem', 9.99, 5),
        ('Colar de Pérolas', 29.99, 6),
        ('Shampoo Hidratante', 14.99, 7),
        ('Livro "Mistérios do Universo"', 24.99, 8),
        ('Helicóptero de Controle Remoto', 49.99, 9),
        ('Bola de Vôlei', 19.99, 10);

    INSERT INTO tamanho (tamanho, estoque, codProduto) 
    VALUES 
        ('Único', 10, 1),
        ('P', 20, 2),
        ('M', 50, 2),
        ('G', 15, 2),
        ('GG', 5, 2),
        ('39', 8, 3),
        ('40', 30, 3),
        ('41', 12, 3),
        ('42', 18, 3),
        ('43', 7, 3),
        ('2 Lugares', 25, 4),
        ('3 Lugares', 20, 4),
        ('4 Lugares', 15, 4),
        ('1kg', 100, 5),
        ('5kg', 200, 5),
        ('Único', 100, 6),
        ('Único', 30, 7),
        ('Único', 20, 8),
        ('Único', 15, 9),
        ('Único', 10, 10),
        ('Único', 5, 11),
        ('P', 30, 12),
        ('M', 25, 12),
        ('G', 20, 12),
        ('GG', 15, 12),
        ('38', 25, 13),
        ('39', 18, 13),
        ('40', 15, 13),
        ('41', 20, 13),
        ('42', 10, 13),
        ('Queen Size', 15, 14),
        ('1 Litro', 50, 15),
        ('Único', 30, 16),
        ('500ml', 30, 17),
        ('1l', 30, 17),
        ('Único', 25, 18),
        ('Único', 20, 19),
        ('Único', 15, 20);

    INSERT INTO vendas (data, codVendedor, codCondPagto, codCliente)
    VALUES 
        ('2023-11-01', 1, 3, 2),
        ('2023-11-03', 4, 1, 5),
        ('2023-11-05', 2, 2, 1),
        ('2023-11-08', 3, 4, 3),
        ('2023-11-12', 5, 5, 4),
        ('2023-11-15', 1, 1, 7),
        ('2023-11-18', 4, 3, 10),
        ('2023-11-22', 2, 2, 8),
        ('2023-11-25', 3, 4, 6),
        ('2023-11-28', 5, 5, 9);

    INSERT INTO vendasProduto (codVendas, codProduto, desconto, qtde) 
    VALUES
        (1, 9, 0.1, 3),
        (1, 2, 0.1, 2),
        (2, 4, 0.05, 5),   
        (2, 5, 0.1, 1),    
        (2, 6, 0.08, 2),   
        (3, 7, 0.12, 4),   
        (3, 8, 0.15, 1),   
        (3, 9, 0.2, 3),    
        (3, 10, 0.05, 2),  
        (4, 11, 0.1, 1),   
        (5, 12, 0.15, 3),  
        (5, 13, 0.08, 2),  
        (6, 14, 0.12, 1),  
        (6, 15, 0.1, 4),   
        (6, 16, 0.05, 2),  
        (6, 17, 0.18, 1),  
        (7, 18, 0.1, 2),   
        (8, 19, 0.2, 3),   
        (8, 20, 0.15, 1); 



/*UPDATE*/
    UPDATE cliente SET endereco = 'Rua das Flores, 456', telefone = '(11) 5555-5555' WHERE cod = 1;

    UPDATE vendedor SET senha = 'NovaSenha123', percComis = 0.12 WHERE cod = 1;

    UPDATE condPagto SET descricao = 'À vista com desconto' WHERE cod = 1;

    UPDATE categoria SET categoria = 'Eletrônicos Premium' WHERE cod = 1;

    UPDATE produto SET preco = 999.99, codCategoria = 2 WHERE cod = 1;

    UPDATE tamanho SET estoque = 50 WHERE cod = 1;

    UPDATE vendas SET data = '2023-12-01', codVendedor = 2 WHERE cod = 1;

    UPDATE vendasProduto SET codProduto = 5 WHERE codVendas = 1 AND codProduto = 1;

/*DELETE*/
    DELETE FROM vendasProduto WHERE codVendas = 1;

    DELETE FROM tamanho WHERE cod = 5;


/*VIEW*/
    
    CREATE VIEW retornaNome AS SELECT * FROM cliente WHERE lower(nome) LIKE '%santos' ORDER BY nome;

    CREATE VIEW retornaProdutosVendidos AS SELECT p.nome, vp.qtde, vp.desconto  FROM vendasProduto vp INNER JOIN produto p ON vp.codProduto = p.cod where vp.codVendas = 2 ORDER BY p.nome  
    
    CREATE VIEW retornaVendas AS SELECT v.*, c.nome AS cliente, vend.nome AS vendedor FROM vendas v INNER JOIN cliente c ON v.codCliente = c.cod INNER JOIN vendedor vend ON v.codVendedor = vend.cod WHERE DATA BETWEEN '2023-11-03' AND '2023-11-08' ORDER BY v.cod

    CREATE VIEW retornaProduto AS SELECT p.nome, t.tamanho, t.estoque FROM tamanho t INNER JOIN produto p ON t.codProduto = p.cod WHERE LOWER(p.nome) LIKE '%camisa%'

    