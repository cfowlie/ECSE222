library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_counter is
end tb_counter;

architecture behavior of tb_counter is

	-- Declare component
	component counter is
		port (
			clk 		: in std_logic;
			rst 		: in std_logic;
			count 		: out std_logic_vector (3 downto 0)
			);
	end component;

	-- Inputs
	signal clk_in 		: std_logic;
	signal rst_in 		: std_logic;

	-- Outputs
	signal count_out 	: std_logic_vector (3 downto 0);

	-- Helpers
	constant clk_period : time := 10 ns;

begin

	-- Inst the counter
	dut: counter
	port map (
			clk => clk_in,
			rst => rst_in,
			count => count_out
		);

	-- Create a clock signal
	clk_process: process
	begin
		clk_in <= '0';
		wait for clk_period/2;
		clk_in <= '1';
		wait for clk_period/2;
	end process;

	-- Init system
	init: process
	begin
		wait for clk_period;
		rst_in <= '1';
		wait for clk_period;
		rst_in <= '0';
		wait;
	end process;

	test: process
	begin
		wait for clk_period * 3;

		assert count_out = "0000" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0001" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0010" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0011" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0100" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0101" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0110" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0111" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "1000" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "1001" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "1000" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0111" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0110" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0101" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0100" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0011" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0010" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0001" report "Error" severity Error;
		wait for clk_period;

		assert count_out = "0000" report "Error" severity Error;
		wait for clk_period;

		-- Stop simulation
		assert false report "Counter test Success!" severity failure;
	end process;

end behavior;





