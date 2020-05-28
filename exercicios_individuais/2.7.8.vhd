----------------------------
--Nome: Eric Tamashiro Kurachi
--NUSP: 10310996
--Data: 04/03/2019

--Exercício 2.7.8

--Descrição: Encontrar os erros no programa. Os erros estão comentados com as correções abaixo deles.
----------------------------

ENTITY errad_2 IS
  PORT (a, b, c, d : IN  BIT;
        r, s, t, u, v, x    : OUT BIT_VECTOR (0 TO 5)); 
END errad_2;

ARCHITECTURE teste OF errad_2 IS
BEGIN
  r(0 TO 2) <= a & b & c;                --correto
  s <= a & b & c & "010";                --correto
  
  --t(0 TO 2) & u(3 TO 5) <= "101101";   --errado: o operador "&" nao pode ser utilizado do lado esquerdo do operador '<='
  t(0 TO 2) <= "101";
  u(3 TO 5) <= "101";
  
  v <= a & (OTHERS => '0');              --correto 
  
  --x <= a & (OTHERS => '0') & '1';      --errado: "OTHERS" deve ser a ultima associacao na lista de associacoes, pois identifica os elementos nao especificados
  x <= a & (0 => '1', OTHERS => '0') ;   --correcao
END teste;