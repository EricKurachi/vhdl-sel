LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Gerador is
	generic(
		bussize	: integer := 16);
	port(
		clk, clr : in  std_logic;
		start	 : in  std_logic;
		x0		 : in  std_logic_vector(bussize-1 downto 0);
		xnout	 : buffer std_logic_vector(bussize-1 downto 0));	--na vdd, é um out std_logic_vector
end Gerador;

architecture behavior of Gerador is

component Mux is
    port(a, b, s : in  std_logic;
	 x       : out std_logic);
end component;

--FliFlop tipo D
procedure ffd (
	signal d	:	in  std_logic;
	signal clkffd	:	in  std_logic;
	signal rst : in std_logic;
	signal q	:	out std_logic) is
	begin
		if rst='1' then
			q <= '0';
		elsif clkffd'event AND clkffd = '1' then
			q <= d;
		end if;
end ffd;

signal aux : std_logic_vector(bussize-1 downto 0);
--signal xfuture : std_logic_vector(bussize-1 downto 0);

begin
MUX_loop:
	for i in bussize-1 downto 0 generate
		MX: Mux port map(x0(i),xnout(i),start,aux(i));				----mudar no futuro para xfuture
	end generate MUX_loop;


FFDs_loop:
	for i in bussize-1 downto 0 generate
		ffd(aux(i),clk,clr,xnout(i));
	end generate FFDs_loop;	
end behavior;	
