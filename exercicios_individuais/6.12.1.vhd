----------------------------
--Nome Eric Tamashiro Kurachi
--NUSP 10310996
--
--Exercício 6.12.1
----------------------------

ENTITY reg IS
  PORT (enb  : IN  BIT;              -- habilita
		sel  : IN  INTEGER;
        d    : IN  BIT;
        q    : OUT BIT_VECTOR(3 DOWNTO 0));    
END reg;

ARCHITECTURE teste OF reg IS
BEGIN
  PROCESS (enb, d, sel)
  BEGIN
    IF(enb ='1') THEN  
		IF    (sel = '0') THEN q(0) <= d;
		ELSIF (sel = '1') THEN q(1) <= d;
		ELSIF (sel = '2') THEN q(2) <= d;
		ELSE                   q(3) <= d;
		END IF;
    END IF;
  END PROCESS;
END teste;
