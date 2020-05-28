----------------------------
--Nome Eric Tamashiro Kurachi
--NUSP 10310996
--
--Exercício 6.12.11
----------------------------

ENTITY maq_est IS
  PORT (ck      :  IN     BIT;                  
        e   	:  IN     BIT;                    
        iniciar :  IN     BIT;                     
        q       :  OUT    BIT_VECTOR (1 DOWNTO 0)); 
END maq_est;

ARCHITECTURE teste OF maq_est IS
 
  TYPE st IS (s0, s1, s2, s3);  
  SIGNAL estado : st;                         
BEGIN
  abc: PROCESS (ck, iniciar)
  BEGIN
    IF iniciar = '1' THEN                 
      estado <= s0;                   
    ELSIF (ck'EVENT and ck ='1') THEN    
      CASE estado IS
        WHEN s0 =>                          
          IF e = '1' THEN estado <= s1;  
          ELSE            estado <= s2;   
          END IF;
        WHEN s1 =>                          
          IF e = '1' THEN estado <= s3;  
          ELSE            estado <= s2;  
          END IF;
        WHEN s2 =>                          
          IF e = '1' THEN estado <= s1;  
          ELSE            estado <= s0;  
          END IF;
        WHEN s3 =>                          
          IF e = '1' THEN estado <= s0;  
          ELSE            estado <= s2;  
          END IF;
       END CASE;
    END IF;
  END PROCESS abc;
  
    q <= "00" WHEN (estado = s0 AND e = '0') OR (estado = s1 AND e = '0'), 
         "01" WHEN (estado = s0 AND e = '1') OR (estado = s2 AND e = '1'),
		 "10" WHEN (estado = s2 AND e = '0') OR (estado = s3 AND e = '0'),
         "11" WHEN (estado = s1 AND e = '1') OR (estado = s3 AND e = '1'), 