library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port(p, q, c: in  std_logic
         sum    : out std_logic
         carry  : out std_logic);
end full_adder;

architecture behavior of full_adder is
begin  
    sum   <= p xor q xor c;
    carry <= (p and q) or (p and c) or (q and c);
end behavior;
