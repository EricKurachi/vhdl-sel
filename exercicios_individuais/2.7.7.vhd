----------------------------
--Nome: Eric Tamashiro Kurachi
--NUSP: 10310996
--Data: 04/03/2019

--Exercício 2.7.7

--Descrição: Encontrar os erros no programa. Os erros estão comentados com as correções abaixo deles.
----------------------------

ENTITY errad_1 IS
  PORT (a, b, c, d : IN  BIT;
        s          : OUT BIT_VECTOR (5 DOWNTO 0)); 
END errad_1;

ARCHITECTURE teste OF errad_1 IS
BEGIN
  --s(0) <= a AND b OR c AND d;     --errado
  s(0) <= (a AND b) OR (c AND d);   --correcao

  --s(1) <= a NOR b NOR c;          --errado
  s(1) <= (a NOR b) NOR c;          --correcao

  --s(2) <= a AND b OR c;           --errado
  s(2) <= (a AND b) OR c;           --correcao

  s(3) <= NOT (a AND b) NAND c;     --correto
  s(4) <= a XOR b XOR c;            --correto  
END teste;