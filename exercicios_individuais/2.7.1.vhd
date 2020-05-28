----------------------------
--Nome: Eric Tamashiro Kurachi
--NUSP: 10310996
--Data: 04/03/2019

--Exercício 2.7.1

--Descrição: Descrever quatro operações lógicas indicadas por "s1", "s2", "s3" e "s4" utiliando como entrada as portas "a", "b", "c" e "d", todas do tipo bit.
----------------------------

ENTITY portas IS
  PORT (a, b, c, d      : IN  BIT;       -- entradas
        s1, s2, s3, s4  : OUT BIT);      -- saidas
END portas;

ARCHITECTURE teste OF portas IS
BEGIN
  s1 <= a OR NOT b                                  -- s1 recebe a + (b barrado)
  s2 <= a OR (NOT b AND c) OR d                     -- s2 recebe a + ((b barrado) . c) + d
  s3 <= (a OR NOT b) AND (c OR d)                   -- s3 recebe (a + (b barrado)) . (c + d)
  s4 <= (a OR NOT b) AND NOT(c OR (a AND d))        -- s4 recebe (a + (b barrado)) . ((c + a.d) barrado)
END teste
 