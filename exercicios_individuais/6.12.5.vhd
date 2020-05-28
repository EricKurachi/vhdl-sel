----------------------------
--Nome Eric Tamashiro Kurachi
--NUSP 10310996
--
--Exercício 6.12.5
----------------------------

ENTITY cnt IS
  PORT (ck1, ck2   : IN  BIT;          
        set1, set2 : IN  BIT;              
        rst1, rst2 : IN  BIT;              
        q          : OUT INTEGER RANGE 3 DOWNTO 0);    
END cnt;

ARCHITECTURE teste OF cnt IS

BEGIN
  abc: PROCESS (ck1, ck2, rst1, rst2, set1, set2)
   VARIABLE qv : INTEGER RANGE 15 DOWNTO 0;
  BEGIN
    IF    (rst1 = '1' AND rst2 = '1') THEN              
      qv := '0000';
	ELSIF (set1 = '1' AND set2 = '1') THEN              
      qv := '1001';  
    ELSIF (ck1'EVENT AND ck1 = '1') THEN    
      IF
        IF qv >= 5  THEN qv := 0;      
        ELSE            qv := qv + 8;  
        END IF;
	ELSIF (ck1'EVENT AND ck1 = '1') THEN    
      IF
        IF qv >= 5  THEN qv := 0;      
        ELSE            qv := qv + 1;  
        END IF; 
      END IF;
    END IF;
  END PROCESS abc;
END teste;