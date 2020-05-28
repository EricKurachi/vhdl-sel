ENTITY cont IS
  PORT (e_end        :  IN  BIT_VECTOR(15 DOWNTO 0);    
        rst_l, ck    :  IN  BIT;                                      
        s_end        :  OUT BIT_VECTOR(7 DOWNTO 0));  
		ras_l, cas_l :  OUT BIT);
END cont;
----------------------------
--Nome Eric Tamashiro Kurachi
--NUSP 10310996
--
--Exercício 6.12.9
----------------------------

ARCHITECTURE teste OF cont IS
BEGIN
  abc: PROCESS (ck)
		VARIABLE i : INTEGER
   BEGIN
    IF ck'EVENT AND ck = '1' THEN 
		IF (i = 0) THEN
		  ras_l <= '1'
		  s_end(0) <= e_end(8)
		  s_end(1) <= e_end(9)
		  s_end(2) <= e_end(10)
		  s_end(3) <= e_end(11)
		  s_end(4) <= e_end(12)
		  s_end(5) <= e_end(13)
		  s_end(6) <= e_end(14)
		  s_end(7) <= e_end(15)
		  i <= i + 1
		ELSIF (i = 2) THEN
		  s_end(0) <= e_end(0)
		  s_end(1) <= e_end(1)
		  s_end(2) <= e_end(2)
		  s_end(3) <= e_end(3)
		  s_end(4) <= e_end(4)
		  s_end(5) <= e_end(5)
		  s_end(6) <= e_end(6)
		  s_end(7) <= e_end(7)
		  i <= i + 1
		ELSIF (i = 3) THEN
		  cas_l <= '1'
		ELSE 
		  ras_l <= '0'
		  cas_l <= '0'
		  i <= '0'
        END IF;
    END IF;
  END PROCESS abc;

END teste;