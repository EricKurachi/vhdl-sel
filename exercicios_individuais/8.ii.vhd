----------------------------
--Nome: Eric Tamashiro Kurachi
--NUSP: 10310996
--arquitetura da celula de um comparador utilizando procedure
--Exercício 8.ii
----------------------------

ENTITY comparador IS 
	PORT (a, b, e_ma, e_me : IN  BIT;
	      s_ma, s_me       : OUT BIT);
END comparador;

ARCHITECTURE teste OF comparador IS
	PROCEDURE comparacao(a, b     : IN  BIT;
			             sma, sme : OUT BIT) IS
	BEGIN
		IF    e_ma = '1' THEN (sma <= '1' AND sme <= '0');
		ELSIF e_mE = '1' THEN (sma <= '0' AND sme <= '1');
		ELSIF (a > b)    THEN (sma <= '1' AND sme <= '0');
		ELSIF (a < b)    THEN (sma <= '0' AND sme <= '1');
		ELSE                   sme <= '0' AND sme <= '0';
		END IF;
	END comparacao;
 
BEGIN
	comparacao(a, b, e_ma, e_me, s_ma, s_me);
END teste;