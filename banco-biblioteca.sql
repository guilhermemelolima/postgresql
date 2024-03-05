CREATE TABLE editora(
   id serial PRIMARY KEY,
   nome VARCHAR(100) NOT NULL
);

CREATE TABLE autor(
    id serial PRIMARY KEY,
   nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros(
id  serial PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
isnb  VARCHAR(20) NOT NULL,
local_edicao VARCHAR(20) NOT NULL,
id_editora INTEGER
);

CREATE TABLE livros_autor(
     cod serial PRIMARY KEY,
     id_livro INTEGER,
     id_autor INTEGER
);


CREATE TABLE palavras_chave(
       id SERIAL PRIMARY KEY,
       palavra VARCHAR(30) NOT NULL,
       id_livro INTEGER
);


CREATE TABLE exemplar(
     numero SERIAL PRIMARY KEY,
     id_livro INTEGER
);

CREATE TABLE funcionario(
      matricula SERIAL PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      endereco VARCHAR(100) NOT NULL,
      cpf  VARCHAR(14) NOT NULL,
      telefone VARCHAR(15) NOT NULL
);

CREATE TABLE associado(
     codigo SERIAL PRIMARY KEY,
     nome VARCHAR(100) NOT NULL,
     endereco VARCHAR(100) NOT NULL,
     telefone VARCHAR(15) NOT NULL,
     email VARCHAR(100) NOT NULL
);

CREATE TABLE emprestimo(
     id SERIAL PRIMARY KEY,
     data date NOT NULL,
     id_associado INTEGER NOT NULL,
     id_funcionario INTEGER NOT NULL
);

CREATE TABLE exemplares_emprestimo(
        id SERIAL PRIMARY KEY,
        num_exemplar INTEGER,
        num_emprest INTEGER
);


ALTER TABLE livros ADD CONSTRAINT livros_editora_fk FOREIGN KEY (id_editora) 
REFERENCES editora(id);

ALTER TABLE livros_autor ADD CONSTRAINT autor_fk FOREIGN KEY (id_autor) 
REFERENCES autor(id);

ALTER TABLE livros_autor ADD CONSTRAINT livro_fk FOREIGN KEY (id_livro) 
REFERENCES livros(id);

ALTER TABLE palavras_chave ADD CONSTRAINT palavras_chave_livro_fk FOREIGN KEY (id_livro) REFERENCES livros (id);

ALTER TABLE exemplar ADD CONSTRAINT exemplar_livro_livro_fk FOREIGN KEY (id_livro) REFERENCES livros (id);

ALTER TABLE emprestimo ADD CONSTRAINT emprestimo_func_fk FOREIGN KEY (id_funcionario) REFERENCES funcionario (matricula);

ALTER TABLE emprestimo ADD CONSTRAINT emprestimo_assoc_fk FOREIGN KEY (id_associado) REFERENCES associado (codigo);

ALTER TABLE exemplares_emprestimo ADD CONSTRAINT exemplares_emprest_exem_fk FOREIGN KEY (num_exemplar) REFERENCES exemplar (numero);

ALTER TABLE exemplares_emprestimo ADD CONSTRAINT exemplares_emprest_empr_fk FOREIGN KEY (num_emprest) REFERENCES emprestimo (id); 


INSERT INTO editora (nome) VALUES ('Érica');
INSERT INTO editora (nome) VALUES ('Pearson');
INSERT INTO editora (nome) VALUES ('Atlas');
INSERT INTO editora (nome) VALUES ('Cruzeiro do Sul');
INSERT INTO editora (nome) VALUES ('Cultura');

INSERT INTO autor(nome) VALUES ('João da Silva Nunes');
INSERT INTO autor(nome) VALUES ('José Silberchatz');
INSERT INTO autor(nome) VALUES ('Maria Fernanda Ascencio');
INSERT INTO autor(nome) VALUES ('Elias Nielsen');
INSERT INTO autor(nome) VALUES ('Simone Barbosa');
INSERT INTO autor(nome) VALUES ('José Antonio Soares');
INSERT INTO autor(nome) VALUES ('Eliana Martins');

INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Introdução a Linguagem de Programação','ASC009444','São Paulo',2);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Introdução a Programação Java','’KDFG009444','São Paulo',3);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Introdução a Lógica','MADF878441','Rio de Janeiro',2);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Introdução a Banco de Dados','PUQASC00326','São Paulo',2);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Banco de Dados NoSQL','ASC007442','São Paulo',4);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Banco de Dados PostgreSQL','LASC007442','Rio de Janeiro',1);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Front End - CSS','XVDC007442','São Paulo',4);
INSERT INTO livros (titulo, isnb,local_edicao, id_editora) VALUES ('Front End – CSS- avançado','FFSS009981','Rio de Janeiro',5);

INSERT INTO livros_autor (id_livro,id_autor) VALUES (1,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (1,3);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (1,4);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (2,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (2,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (3,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (3,4);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (4,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (5,3);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (5,4);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,7);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (7,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (7,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (8,6);


INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Lógica',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('programação',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Lógica',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Lógica',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('SQL',4);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('SQL',5);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('SQL',6);

INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (2);
INSERT INTO exemplar (id_livro) VALUES (2);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (4);
INSERT INTO exemplar (id_livro) VALUES (4);
INSERT INTO exemplar (id_livro) VALUES (4);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (7);
INSERT INTO exemplar (id_livro) VALUES (7);
INSERT INTO exemplar (id_livro) VALUES (8);

INSERT INTO funcionario  (nome, endereco, cpf, telefone) VALUES ('Andreia','Rua 14 novembro – 300','14689836801','(15)99720-3434');
INSERT INTO funcionario  (nome, endereco, cpf, telefone) VALUES ('Kelly Maria','Avenida Soares Hunria','13889836801','(15)99820-3413');

INSERT INTO associado (nome,endereco, telefone, email) VALUES ('José da Silva','Rua XV de novembro – 1234','(15)3453-4545','silva01@gmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('Maria Cristina da Silva','Rua XV de novembro – 154','(15)3453-4045','mariasilva01@gmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('André da Silva Cruz','Rua V de novembro – 1234','(15)3466-4545','andresilva01@hotmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('Kely Maria Braga','Rua primo moras – 34','(15)3453-4545','kelym01@gmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('José da Silva Moraes','Rua XV de novembro – 700','(19)3453-4545','josesilva01@gmail.com');

INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-10',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-11',1,1);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-12',2,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-13',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-20',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-22',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-22',3,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-24',3,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-30',4,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-25',2,1);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-01',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-01',3,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-05',4,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-06',5,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-05',2,2);
												

INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (1,2);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (2,2);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (1,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (1,3);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (4,3);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (5,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (6,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (2,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (7,2);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (8,4);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (9,4);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (10,5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (10,5);


-- ! SELECTS

/*  
    * QUESTÃO 1
    ? Crie um select que retorne os livros que tem a palavra “Banco” no titulo, e mostre todos os campos da tabela;
*/
SELECT titulo 
FROM livros 
WHERE LOWER(titulo) LIKE '%banco%'

/*
    * QUESTÃO 2
    ? Crie um select que retorne todos os livros em que a edição é “Rio de Janeiro”, mostre apenas os campos: titulo do livro e o isnb; 
*/
SELECT titulo, isnb
FROM livros
WHERE LOWER(local_edicao) = 'rio de janeiro'

/*
    * QUESTÃO 3
    ? Crie um SELECT que retorne todos os livros de uma editora, por exemplo editora cujo código é 2, mostre todos os campos da tabela livros;
*/
SELECT * 
FROM livros
WHERE id_editora = 2

/*
    * QUESTÃO 4
    ? Crie um SELECT que retorne todos os livros cadastrados, mostrando os campos: titulo, local de edição e o nome da editora;
*/
SELECT l.titulo AS livros, l.local_edicao, e.nome AS editora
FROM livros l
INNER JOIN editora e ON l.id_editora = e.id

/*
    * QUESTÃO 5
    ? Crie um SELECT que retorne todos os livros de um determinado autor, por exemplo autor cujo nome é “Elias Nielsen”, mostrando na tela, o código do livro, titulo e id_autor;
*/
SELECT  l.id, l.titulo, la.id_autor
FROM livros_autor la
INNER JOIN livros l ON l.id = la.id_livro
INNER JOIN autor a ON a.id = la.id_autor
WHERE LOWER(a.nome) = 'elias nielsen'


/*
    * QUESTÃO 6
    ? Crie um SELECT que retorne todos os associados cujo endereço é na XV de novembro, mostrando apenas os campos: nome, telefone e email;
*/
SELECT nome, telefone, email
FROM associado
WHERE LOWER(endereco) LIKE 'rua xv de novembro%'


/*
    * QUESTÃO 7
    ? Crie um SELECT que retorne todos os empréstimos, mas listando também o nome do associado de cada empréstimo;
*/
SELECT em.id AS codigoEmprestimo, a.codigo AS codigoAssociado, a.nome, a.telefone, em.data
FROM emprestimo em
INNER JOIN associado a ON a.codigo = em.id_associado


/* 
    * QUESTÃO 8
    ? Crie um SELECT que retorne os exemplares de um determinado empréstimo, por exemplo num_emprest = 2, mostrando os campos, número do exemplar e titulo do livro;
*/
SELECT ex.numero AS exemplar, l.titulo
FROM exemplares_emprestimo ex_em
INNER JOIN exemplar ex ON ex.numero = ex_em.num_exemplar
INNER JOIN livros l ON l.id = ex.id_livro
WHERE ex_em.num_emprest = 2 

/*
    * QUESTÃO 9
    ? Cria um SELECT que retorne todos os empréstimos do exemplar cujo número é 4.
*/
SELECT em.*, ex_em.num_exemplar
FROM exemplares_emprestimo ex_em
INNER JOIN emprestimo em ON em.id = ex_em.num_emprest
WHERE ex_em.num_exemplar = 4

-- ? colocando nome do funcionario e assciado
SELECT em.id, em.data,a.nome AS associado, f.nome AS funcionario , ex_em.num_exemplar
FROM exemplares_emprestimo ex_em
INNER JOIN emprestimo em ON em.id = ex_em.num_emprest
INNER JOIN funcionario f ON f.matricula = em.id_funcionario
INNER JOIN associado a ON a.codigo = em.id_associado
WHERE ex_em.num_exemplar = 4

/*
    * QUESTÃO 10
    ? Crie um SELECT que retorne os autores do livro cujo código é 3,listando o nome do autor e nome do livro.
*/ 
SELECT a.nome AS autor, l.titulo
FROM livros_autor la 
INNER JOIN livros l ON l.id = la.id_livro
INNER JOIN autor a ON a.id = la.id_autor
WHERE l.id = 3

/*
    * QUESTÃO 11
    ? Criar uma consulta utilizando o GROUP BY totalizando o número de livros por editora, mas deve ser exibido o nome da editora e total de livros por editora.
*/
SELECT ed.nome, COUNT(l.id) AS totalLivros
FROM livros l 
INNER JOIN editora ed ON ed.id = l.id_editora
GROUP BY ed.nome

/*
    * QUESTÃO 12
    ? Criar uma consulta utilizando o GROUP BY totalizando o número de emprestimos por associado, mas deve ser exibido o nome do associado, codigo associado e qtde de emprestimos para cada associado.
*/
SELECT ass.codigo, ass.nome, COUNT(em.id_associado) AS totalEmprestimos
FROM emprestimo em
INNER JOIN associado ass ON ass.codigo = em.id_associado
GROUP BY ass.codigo, ass.nome

/*
    * QUESTÃO 13
    ? Criar uma consulta utilizando o GROUP BY totalizando o número de autores de cada livro, listando o código do livro, o titulo do livro e qtde de autores.
*/
SELECT l.id, l.titulo, COUNT(a.id) AS totalAutores
FROM livros_autor la
INNER JOIN livros l ON l.id = la.id_livro
INNER JOIN autor a ON a.id = la.id_autor
GROUP BY l.id
ORDER BY l.id

/*
    * QUESTÃO 14
    ? Criar uma consulta que retorne a qtde de exemplares de cada livro, listando o código do livro, o nome do livro e a qtde de exemplares.
*/
SELECT l.id, l.titulo, COUNT(ex.numero) AS totalExemplares
FROM exemplar ex
INNER JOIN livros l ON l.id = ex.id_livro
GROUP BY l.id

/*
    * QUESTÃO 15
    ? Cria uma consulta que liste todos os registros da tabela livros e as editoras dos respectivos livros, deve ser utilizado RIGHT JOIN
*/
SELECT l.*, ed.nome AS editora
FROM livros l 
RIGHT JOIN editora ed ON ed.id = l.id_editora


/*
    * QUESTÃO 16
    ? Crie uma consulta que liste todos os registros da tabela associado e os empréstimos desse associado se existir, deve ser utilizado o LEFT JOIN.
*/
SELECT ass.*
FROM associado ass
LEFT JOIN emprestimo em ON ass.codigo = em.id_associado


/*
    * QUESTÃO 17
    ? Crie uma consulta que liste todos os registros da tabela editora e os livros que pertencem a estas editoras, utilize o INNER JOIN. 
*/
SELECT ed.*
FROM livros l
INNER JOIN editora ed ON ed.id = l.id_editora


/*
    * QUESTÃO 18
    ? Crie uma consulta que liste os livros que são da editora “Pearson”, listando apenas as colunas: titulo, local_edicao e isbn, e ordenado pelo titulo.
*/
SELECT l.titulo, l.local_edicao, l.isnb
FROM livros l
INNER JOIN editora ed ON ed.id = l.id_editora
WHERE LOWER(ed.nome) = 'pearson'
ORDER BY l.titulo

/*
    * QUESTÃO 19
    ? Crie uma consulta que liste as palavras chaves de um determinado livro, por exemplo livro “Introdução a Programação”.
*/
SELECT l.titulo, pc.palavra
FROM palavras_chave pc
INNER JOIN livros l ON pc.id_livro = l.id
where lower(l.titulo) = 'introdução a linguagem de programação'


/*
    * QUESTÃO 20
    ? Crie uma consulta que liste todos empréstimos que foram realizados por um determinado funcionário, por exemplo “Jose”. Listando as colunas, número do empréstimo, data e nome do associado.
*/
SELECT em.id, em.data, ass.nome AS associado
FROM emprestimo em
INNER JOIN associado ass ON ass.codigo = em.id_associado
INNER JOIN funcionario fu ON fu.matricula = em.id_funcionario
WHERE LOWER(fu.nome) = 'jose'
