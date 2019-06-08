library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity adder is
	port(as, bs : in  std_logic;
		 cin    : in  std_logic;
		 sum    : out std_logic;
		 cout   : out std_logic);
end adder;

architecture behavior of adder is 
begin  
  sum   <= as xor bs xor cin;
  cout  <= (as and bs) or (as and cin) or (bs and cin);
end behavior;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Multiplicador is
generic (N: integer := 8;M: integer :=8);
port ( a    :  in  std_logic_vector(N-1 downto 0);
       b    :  in  std_logic_vector(M-1 downto 0);
       prod :  out std_logic_vector(M-1 downto 0) );
end entity Multiplicador;

architecture behavior of Multiplicador is

-- Componente do somador completo
component adder is
	port(as, bs : in  std_logic;
             cin    : in  std_logic;
             sum    : out std_logic;
	     cout   : out std_logic);
end component;

-- Signals do multiplicador
type mem_word is array (M-1 downto 0) of std_logic_vector(N-1 downto 0);
signal as   : mem_word;
signal bs   : mem_word;
signal cin  : mem_word;
signal sum  : mem_word;
signal cout : mem_word;


begin
    na: for i in 0 to N-1 generate
        ma: for j in 0 to M-1 generate
            adder_def : adder
            port map (as(i)(j),bs(i)(j),cin(i)(j), sum(i)(j), cout(i)(j));
        end generate ma;
    end generate na;
	
	-- conferido
       cin_start: for j in 0 to M-2 generate 
                 cin(0)(j) <= '0'; 
               end generate cin_start;
	
	-- conferido
       cin_nloop: for i in 1 to N-1 generate
		cin_mloop: for j in 0 to M-2 generate
			cin(i)(j) <= cout(i-1)(j); 
		end generate cin_mloop;
	end generate cin_nloop;
	
	-- 71 M-1
	as_nloop: for i in 0 to N-1 generate
		as_mloop: for j in 0 to M-2 generate
			as(i)(j) <= a(i) and b(j+1);
		end generate as_mloop;
	end generate as_nloop;
	
	-- 78 i
	bs_init: for i in 0 to N-2 generate
		bs(i)(0) <= a(i+1) and b(0);
	end generate bs_init;
	
	-- conferido
	bs_nmid: for i in 0 to N-2 generate
		bs_mmid: for j in 1 to M-2 generate
			bs(i)(j) <= sum(i+1)(j-1);
		end generate bs_mmid;
	end generate bs_nmid;

	-- conferido
	bs_end: for j in 1 to M-3 generate
		bs(N-1)(j) <= cout(N-1)(j-1);
	end generate bs_end;
	
	bs(N-1)(0)   <= '0';
	bs(N-1)(M-2) <= '0';
	
	prod_3: for i in 1 to N-1 generate
		prod(i-1) <= sum(i)(M-2);
	end generate prod_3;

        prod(N-1) <= cout(M-1)(N-2);

end behavior;
