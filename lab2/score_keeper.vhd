library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity score_keeper is 
	Port (
		clk				: in std_logic;
		rst				: in std_logic;
		paddle_left		: in std_logic;
		paddle_right 	: in std_logic;
		counter 		: in std_logic_vector (3 downto 0);
		score_left 		: out std_logic_vector (3 downto 0);
		score_right 	: out std_logic_vector (3 downto 0)
		);
end score_keeper;

architecture behavior of score_keeper is
begin 
	
	process(clk, rst)
		-- Internal values
		variable score_left_reg : unsigned(3 downto 0);
		variable score_right_reg : unsigned(3 downto 0);

	begin 
		-- Reset all Vars
		if rst = '1' then
			score_left_reg := "0000";
			score_right_reg := "0000";

		elsif (clk'event and clk = '1') then
		-- Core Logic

			-- Left missed ball
			if(counter = x"0" and paddle_left = '0') then
				score_right_reg := score_right_reg + 1;

			-- Right missed ball
			elsif (counter = x"9" and paddle_right = '0') then
				score_left_reg := score_left_reg + 1;
			end if;

			-- Set Outputs
				score_left <= std_logic_vector(score_left_reg);
				score_right <= std_logic_vector(score_right_reg);
		end if;
	end process;
end behavior;
			