library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Mux is
    port(a, b, s : in  std_logic;
	 x       : out std_logic);
end Mux;

architecture behavior of Mux is
begin 
    with s select
        x <= a when '0',
	     b when '1';
end behavior;
