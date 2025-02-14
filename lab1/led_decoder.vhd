--Import libraries
library ieee;
use ieee.std_logic_1164.all;

--Declare entity
entity led_decoder is
	Port (
		count					: in std_logic_vector (3 downto 0); --counter value
		leds					: out std_logic_vector (9 downto 0) --which LEDs are on
		);
end led_decoder;

architecture behaviour of led_decoder is
begin

	leds(9) <= not count(0) and not count(1) and not count(2) and not count(3);
	leds(8) <= count(0) and not count(1) and not count(2) and not count(3);
	leds(7) <= not count(0) and count(1) and not count(2) and not count(3);
	leds(6) <= count(0) and count(1) and not count(2) and not count(3);
	leds(5) <= not count(0) and not count(1) and count(2) and not count(3);
	leds(4) <= count(0) and not count(1) and count(2) and not count(3);
	leds(3) <= not count(0) and count(1) and count(2) and not count(3);
	leds(2) <= count(0) and count(1) and count(2) and not count(3);
	leds(1) <= not count(0) and not count(1) and not count(2) and count(3);
	leds(0) <= count(0) and not count(1) and not count(2) and count(3);
	
end behaviour;