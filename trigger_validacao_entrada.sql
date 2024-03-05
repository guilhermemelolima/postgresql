CREATE TABLE agendamentos(
	id SERIAL PRIMARY KEY,
	nome TEXT,
	evento TEXT,
	dataInicio TIMESTAMP,
	dataFim TIMESTAMP
);
 
CREATE FUNCTION funVerificaAgendamentos() RETURNS "trigger" as $$
	BEGIN
	-- vERIFICA SE A DATA DE INÍCIO É MAIOR QUE A DATA DE FIM
	IF NEW.dataInicio > NEW.dataFim THEN
		RAISE EXCEPTION 'A DATA DE INÍCIO NÃO PODE SER MAIOR QUE A DATA DE FIM';
	END IF;
	-- VERIFICA SE HÁ SOBREPOSIÇÃO COM AGENDAMENTOS EXISTENTES
	IF EXISTS (
		SELECT * FROM agendamentos WHERE nome = NEW.nome
			AND ((dataInicio, dataFim) OVERLAPS
				(NEW.dataInicio, NEW.dataFim))
	)
	THEN
		RAISE EXCEPTION 'IMPOSSÍVEL AGENDAR - EXISTE OUTRO COMPROMISSO';
	END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER trgAgendamentosIns 
BEFORE INSERT ON agendamentos 
FOR EACH ROW EXECUTE PROCEDURE 
funVerificaAgendamentos();
 
CREATE TRIGGER trgAgendamentosUpd 
BEFORE UPDATE ON agendamentos 
FOR EACH ROW EXECUTE PROCEDURE 
funVerificaAgendamentos();
 
INSERt INTO agendamentos VALUES
(DEFAULT,'Joana','Congresso','2005-08-23','2005-08-25')
 
INSERt INTO agendamentos VALUES
(DEFAULT,'Joana','Viagem','2005-08-24','2005-08-26')
 
INSERt INTO agendamentos VALUES
(DEFAULT,'Joana','Palestra','2005-08-23','2005-08-26')
 
SELECT * FROM agendamentos