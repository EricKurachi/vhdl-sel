ENTITY comparator IS
 GENERIC( n        : INTEGER := 4);
 PORT   ( a,b      : BIT_VECTOR ( n-1 TO 0);
          s_1, s_2 : OUT BIT);
END comparator;

ARCHITECTURE teste OF comparator IS
  COMPONENT comp_1a
    PORT( ai, bi, e_ma, e_me : IN  BIT; 
	      s_ma, s_me         : OUT BIT);
  END COMPONENT;
  
  SIGNAL v,w : BIT_VECTOR ( n DOWNTO 0);
  v(0) <= '0';
  w(0) <= '0';
  s_1 <= v(n);
  s_2 <= w(n)
  
BEGIN
 abc: FOR i IN 0 TO n-1 GENERATE
     centro: comp_1a PORT MAP( a(i), b(i), v(i), w(i), v(i+1), w(i+1);
 END GENERATE abc;
 
END TESTE;
