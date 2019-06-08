library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Mux is 
	generic(N: natural := 8);
   port( a, b  : in  std_logic_vector(N-1 downto 0);
			s		: in  std_logic;
		   x     : out std_logic_vector(N-1 downto 0));
end Mux;

architecture behavior of Mux is
begin
        x <= a when s='1' else
				     b;
end behavior;
