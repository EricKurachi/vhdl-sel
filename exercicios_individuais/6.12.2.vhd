----------------------------
--Nome Eric Tamashiro Kurachi
--NUSP 10310996
--
--Exercício 6.12.2
----------------------------
ENTITY jk IS
   PORT( j1,k1  : IN  BIT;
         rl1    : IN  BIT;
         ck     : IN  BIT;
         q1, qb1: OUT BIT);
END jk;

ARCHITECTURE teste OF jk IS
BEGIN
   PROCESS (ck, rl1, j1, k1) 
   BEGIN
      IF (ck'EVENT AND ck =	'0') THEN                 
         IF    (rl1 = '0') THEN
			   q1 <= '0';
         ELSIF (rl1 = '1') THEN
            IF    (J='0' and K='0') THEN
               q1 <= q1;
            ELSIF (J='0' and K='1') THEN
               q1 <= '0';
            ELSIF (J='1' and K='0') THEN
               q1 <= '1';
            ELSIF (J='1' and K='1') THEN
               q1 <= not (q1);
            END IF;
         END IF;
      END IF;
	  qb1 <= not(q1)
   END PROCESS;
END teste;