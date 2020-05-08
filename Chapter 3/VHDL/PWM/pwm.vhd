-- PWM module

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pwm is
	generic (res: integer :=8;
				freq: integer :=100000;
				sys_clk: integer :=50000000); 
	port( set,rst,clk: in std_logic;
	      duty: in std_logic_vector(res-1 downto 0);
	      pwm_out: out std_logic);
end pwm;

architecture behaviour of pwm is
	constant period: integer := sys_clk/freq;
	signal half: integer range 0 to period/2;
	signal half_new: integer range 0 to period/2 :=0;
	signal count: integer range 0 to period-1;
begin
	process(clk,rst)
	begin
		if rst='1' then
			pwm_out <= '0';
			count <= 0;
		elsif (clk'event and clk='1') then
			if set='1' then
				half_new <= conv_integer(duty)*period/(2**res)/2;
			end if;
			if count=period-1 then
				count <= 0;
				half <= half_new;
			else
				count <= count + 1;
			end if;
			if count=half then
				pwm_out <= '0';
			elsif (count=period-half) then
				pwm_out <= '1';
			end if;
		end if;
	end process;
end behaviour;