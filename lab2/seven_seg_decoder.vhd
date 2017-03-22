library ieee;
use ieee.std_logic_1164.all;

entity seven_seg_decoder is
	Port (
		number 	: in std_logic_vector (3 downto 0);
		segments 	: out std_logic_vector (6 downto 0)
		);
end seven_seg_decoder;

architecture behaviour of seven_seg_decoder is
begin
	process(number)
	begin
		case number is
			when "0000" => segments <= "1000000";
			when "0001" => segments <= "1111001";
			when "0010" => segments <= "0100100";
			when "0011" => segments <= "0110000";
			when "0100" => segments <= "0011001";
			when "0101" => segments <= "0010010";
			when "0110" => segments <= "0000010";
			when "0111" => segments <= "1111000";
			when "1000" => segments <= "0000000";
			when "1001" => segments <= "0010000";
			when others => segments <= "1010101";
		end case;
	end process;

end behaviour;

