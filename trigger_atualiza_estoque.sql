/*
	Crie uma gatilho que faça a atualização da quantidade de estoque de uma
	tabela de produtos. Essa atualização deve acontecer após fazer o insert 
	em uma tabela de pedidos.
 
	! Crie uma tabela de produtos, Uma tablea de pedidos, a função para atualizar o estoque e o gatilho
*/
 
DROP TABLE pedido
DROP TABLE estoque
 
CREATE TABLE produto(
	cod SERIAL PRIMARY KEY,
	nomeProduto TEXT,
	quantidade INTEGER
);
 
CREATE TABLE pedido(
	codPedido SERIAL PRIMARY KEY,
	codProduto INTEGER REFERENCES produto(cod),
	quantidade INTEGER
);
 
 
INSERT INTO produto (nomeProduto,quantidade)
VALUES ('BORRACHA',20);
 
CREATE OR REPLACE FUNCTION atualizaEstoque() RETURNS "trigger" AS $$
	BEGIN	
		UPDATE produto
		SET quantidade = quantidade - new.quantidade 
		WHERE cod = new.codProduto;
		RETURN NEW;		
	END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER trgAtualizaEstoque
AFTER INSERT ON pedido
FOR EACH ROW EXECUTE PROCEDURE
atualizaEstoque();
 
SELECT * FROM produto
 
insert into pedido(codProduto, quantidade)
VALUES (1,10)