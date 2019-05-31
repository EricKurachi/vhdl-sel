library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity mux is
	port(a, b, s : in  std_logic;
		 x       : out std_logic);
end mux;

architecture behavior of mux is
begin 
	with s select
		x <= a when "0"
			 b when "1"
end behavior;