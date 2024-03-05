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

/*
	Crie uma gatilho que faça a atualização da quantidade de estoque de uma
	tabela de produtos. Essa atualização deve acontecer após fazer o insert 
	em uma tabela de pedidos.
 
	! Crie uma tabela de produtos, Uma tablea de pedidos, a função para atualizar o estoque e o gatilho
*/
  
 
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

/*
    Crie um gatilho que faça a verificação se a quantidade vendida do produto é maior que a quantidade em estoque.
    Exiba uma mensagem e não deixe realizar o pedido. Essa verificação deve acontecer antes do inser na tabela pedidos.
*/

CREATE OR REPLACE FUNCTION verificaEstoque() RETURNS "trigger" AS $$
	BEGIN		
		IF NEW.quantidade > (SELECT quantidade FROM produto WHERE NEW.codProduto = produto.cod) THEN
			RAISE EXCEPTION 'Valor em estoque insuficiente';
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trgVerificaEstoque
BEFORE INSERT ON pedido
FOR EACH ROW EXECUTE PROCEDURE
verificaEstoque();

INSERT INTO pedido(codProduto,quantidade)
VALUES (1,21);