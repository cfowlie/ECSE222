library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_clock_divider is
end tb_clock_divider;

architecture behavior of tb_clock_divider is

	-- Device as Component
	component clock_divider is
	Generic (slow_factor : integer := 1000);
	Port (
		clk 		: in std_logic;
		rst 		: in std_logic;
		slow_clk 	: out std_logic
		);
	end component;

	-- Input
	signal clk_in : std_logic;
	signal rst_in : std_logic;

	-- Output
	signal clk_out : std_logic;

	-- Helper
	constant clk_period : time := 10 ns;
	constant run_time : integer := 5000;

begin

	-- Inst clock_divider
	clk_div: clock_divider
	port map (
		clk => clk_in,
		rst => rst_in,
		slow_clk => clk_out
		);

	-- Create clock signal
	clk_process : process
	begin
		clk_in <= '0';
		wait for clk_period/2;
		clk_in <= '1';
		wait for clk_period/2;
	end process;

	-- Unit test
	test:  process
	begin 
		rst_in <= '1';
		wait for clk_period;
		assert clk_out = '0' report "Error1" severity Error;
		rst_in <= '0';

		wait for clk_period * (run_time);
		assert clk_out = '1' report "Error2" severity Error;

		-- Stop sim
		assert false report "Clock divider test Success!" severity failure;
	end process;

end behavior;







