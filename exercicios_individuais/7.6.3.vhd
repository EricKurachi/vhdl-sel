ENTITY som_b1 IS
  PORT   (a, b, ve  : IN  BIT;
          s, vs     : OUT BIT); 
END som_b1;

ARCHITECTURE teste OF som_b1 IS
BEGIN
  s  <=  a XOR b  XOR ve;                     
  vs <= (a AND b) OR (a AND ve) OR (b AND ve); 
END teste;

ENTITY som_b2 IS
  PORT  ( x, y  : IN  BIT_VECTOR (3 DOWNTO 0);  
          s     : OUT BIT_VECTOR (3 DOWNTO 0)); 
 END som_e2;

ARCHITECTURE estrutural OF som_e2 IS
  COMPONENT som_b1
    PORT   (a, b, ve : IN  BIT := '0';  
	        s, vs    : OUT BIT); 
  END COMPONENT;

  SIGNAL v : BIT_VECTOR (3 DOWNTO 1); 
  
BEGIN
  x0: som_e1 PORT MAP(x(0), y(0), OPEN, s(0), v(1));
  x1: som_e1 PORT MAP(x(1), y(1), v(1), s(1), v(2));  
  x2: som_e1 PORT MAP(x(2), y(2), v(2), s(2), v(3));
  x3: som_e1 PORT MAP(x(3), y(3), v(3), s(3), OPEN);
END estrutural;