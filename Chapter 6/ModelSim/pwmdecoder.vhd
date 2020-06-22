library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pwmdecoder is
	generic( 
		dec_clkspeed:					integer	:=	50_000_000;
		dec_pwmfrequency:			integer := 	100_000;
		dec_resolution:				integer	:=	8
	);
	port (
		dec_clk:				in 	std_logic;
		dec_rst:				in	std_logic;
		dec_pwm:				in	std_logic;
		dec_direction:	in	std_logic;
		dec_pulsewidth:	out	std_logic_vector(dec_resolution downto 0)
	);
end entity pwmdecoder;

architecture rtl of pwmdecoder is
	constant period:	integer		:=	dec_clkspeed/dec_pwmfrequency;
	signal D:					integer range 0 to period-1 := 0;
	signal start:			std_logic := '0';
begin
	process(dec_clk, dec_rst, dec_pwm) begin
		if(dec_rst = '1') then
			D <= 0;
			dec_pulsewidth <= std_logic_vector(to_unsigned(0,dec_pulsewidth'length));
		elsif rising_edge(dec_pwm) then
			D <= 0;
			start <= '1';
		elsif rising_edge(dec_clk) and (start = '1') then
			if(dec_pwm = '1') then
				D <= D + 1; --Counting number of high ticks.
			elsif(dec_pwm = '0') then
				start <= '0';
				dec_pulsewidth <= std_logic_vector(to_unsigned(D,dec_pulsewidth'length)); --Outputting number of high ticks.
			end if;
		end if;
	end process;	
end architecture rtl;