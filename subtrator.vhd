LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FullSubtractor IS
    PORT(p, q, b 			: IN  STD_LOGIC;
         subtraction    : OUT STD_LOGIC;
         borrow  			: OUT STD_LOGIC);
END FullSubtractor;

ARCHITECTURE behavior1 OF FullSubtractor IS
BEGIN  
    subtraction <= (p xor q) xor b;
    borrow <= (not p and q) or (not p and b) or (q and b);
END behavior1;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Grupo02 IS
   GENERIC(N     : integer := 4);    
	PORT (a,b	:	IN  STD_LOGIC_VECTOR (0 TO N-1);
			ans	:	OUT STD_LOGIC_VECTOR(0 TO N-1));
END Grupo02;

ARCHITECTURE behavior2 OF Grupo02 IS

COMPONENT FullSubtractor
    PORT(p, q, b 			: IN  STD_LOGIC;
         subtraction    : OUT STD_LOGIC;
         borrow  			: OUT STD_LOGIC);
END COMPONENT;
	
SIGNAL aux	:	STD_LOGIC_VECTOR(1 TO N);
BEGIN
	ans(0) <= a(0) xor b(0);
	aux(1) <= not a(0) and b(0);
	SUB:
		FOR i IN 1 TO N-1 GENERATE
			SUBX: FullSubtractor PORT MAP(a(i),b(i),aux(i),ans(i),aux(i+1));
		END GENERATE SUB;
END behavior2;



