library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity clock_divider is
	Generic(slow_factor : integer := 1000000);
	Port (
		clk 		: in std_logic;
		rst 		: in std_logic;
		slow_clk 	: out std_logic
		);
end clock_divider;

architecture behavior of clock_divider is
	signal clk_reg : std_logic;
begin 
	process(clk)
		variable counter_reg : integer := 0;

	begin
		if(rst = '1') then
			counter_reg := 0;
			clk_reg <= '0';
		elsif (clk'event and clk = '1') then
			counter_reg := counter_reg + 1;

			if (counter_reg = slow_factor) then
				clk_reg <= not clk_reg;
				counter_reg := 0;
			end if;
		end if;
	end process;

	slow_clk <= clk_reg;

end behavior;