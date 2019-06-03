entity logisticmap is
	generic(
		bussize	: integer := 16
		);
	port(
		clk, clr : in  std_logic;
		start	 : in  std_logic;
		x0		 : in  std_logic_vector(bussize-1 downto 0);
		xnout	 : out std_logic_vector(bussize-1 downto 0)
		);
end logisticmap;

architecture 
	

------------------------------------------------------
--FliFlop tipo D
PROCEDURE ffd (
	SIGNAL d	:	IN  STD_LOGIC;
	SIGNAL clkffd	:	IN  STD_LOGIC;
	SIGNAL q	:	OUT STD_LOGIC) IS
	PROCESS
	BEGIN
		WAIT UNTIL clkffd'EVENT AND clkffd = '1';
		q <= d;
	END ffd;

FOR I IN 0 TO bussize-1 LOOP
	ffd(aux(i),clk,xnout(i));
END LOOP;
