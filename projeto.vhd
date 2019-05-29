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