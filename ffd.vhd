LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity ffd is
	generic(N: integer := 8);
	port( a				:	in 	 std_logic_vector(N-1 downto 0);
			clk,clr	:	in 	 std_logic;
			saida				:	buffer std_logic_vector(N-1 downto 0));
end ffd;

architecture behavior0 of ffd is
procedure flipflopD (
	signal d	:	in  std_logic_vector(N-1 downto 0);
	signal clkffd	:	in  std_logic;
	signal rst : in std_logic;
	signal q	:	out std_logic_vector(N-1 downto 0)) is
	begin
		if rst='1' then
			q <= (others =>'0');
		elsif clkffd'event AND clkffd = '1' then
			q <= d;
		end if;
end flipflopD;
begin
flipflopD(a,clk,clr,saida);
end behavior0;