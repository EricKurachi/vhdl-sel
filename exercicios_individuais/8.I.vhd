----------------------------
--Nome: Eric Tamashiro Kurachi
--NUSP: 10310996
--arquitetura da celula de um comparador utilizando function
--Exercício 8.i
----------------------------

ENTITY comparador IS 
	PORT (a, b, e_ma, e_me : IN  BIT;
	      s_ma, s_me       : OUT BIT);
END comparador;

ARCHITECTURE teste OF comparador IS

FUNCTION a_maior (a, b, e_ma, e_me : BIT) RETURN BIT IS
	SIGNAL ma : BIT;
BEGIN
	IF    (e_ma = '1') THEN ma <= '1';
	ELSIF (a > b)      THEN ma <= '1';
	ELSE                    ma <= '0';
	END IF; 
	RETURN ma;
END a_maior;

FUNCTION a_menor (a, b, e_ma, e_me : BIT) RETURN BIT IS
	SIGNAL me : BIT;
BEGIN
	IF    (e_me = '1') THEN me <= '1';
	ELSIF (a < b)      THEN me <= '1';
	ELSE                    me <= '0';
	END IF; 
	RETURN me;
END a_menor;

BEGIN
	s_ma <= a_maior(a, b, e_ma, e_me);
	s_me <= a_menor(a, b, e_ma, e_me);
END teste;