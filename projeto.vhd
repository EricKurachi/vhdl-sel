LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity logisticmap is
	generic(bussize : integer := 8);
	port(
		clk, clr	: in	std_logic;
		start		: in	std_logic;
		x0			: in	std_logic_vector(bussize-1 downto 0);
		xnout		: out	std_logic_vector(bussize-1 downto 0));
end logisticmap;			

architecture comportamento of logisticmap is
----------------------------------------------------
--Chamando os componentes
component ffd is
	port( a				:	in 	 std_logic_vector(bussize-1 downto 0);
			clk,clr		:	in 	 std_logic;
			saida			:	buffer std_logic_vector(bussize-1 downto 0));
end component ffd;

component Subtrator is
	port (a,b	:	in  std_logic_vector(bussize-1 downto 0);
			ans	:	out std_logic_vector(bussize-1 downto 0));
end component Subtrator;

component Mux is 
   port( a, b  : in  std_logic_vector(bussize-1 downto 0);
			s		: in  std_logic;
		   x     : out std_logic_vector(bussize-1 downto 0));
end component Mux;

component Multiplicador is
port ( a    :  in  std_logic_vector(bussize-1 downto 0);
       b    :  in  std_logic_vector(bussize-1 downto 0);
       prod :  out std_logic_vector(bussize-1 downto 0) );
end component Multiplicador;

component Deslocador is 
 port( entrada	: in  std_logic_vector(bussize-1 downto 0);
		 saida	: out std_logic_vector(bussize-1 downto 0));
end component;

-----------------------------------------------------
-- Declarando sinais auxiliares
signal pmux	   : std_logic_vector(bussize-1 downto 0); --sinal resultado do mux
signal pmulti  : std_logic_vector(bussize-1 downto 0); --sinal resultado do multiplicador
signal psub	   : std_logic_vector(bussize-1 downto 0); --sinal resultado do subtrator
signal pffd		: std_logic_vector(bussize-1 downto 0); --sinal resultado do fli flop tipo D
signal xfuture : std_logic_vector(bussize-1 downto 0); --sinal X(n+1)

begin
E1 : Mux port map(x0,xfuture,start,pmux);
E2 : ffd port map(pmux,clk,clr,pffd);
E3 : Multiplicador port map(pffd,pffd,pmulti);
E4 : Subtrator port map(pffd,pmulti,psub);
E5 : Deslocador port map(psub,xfuture);
xnout <= pffd;


end comportamento;
