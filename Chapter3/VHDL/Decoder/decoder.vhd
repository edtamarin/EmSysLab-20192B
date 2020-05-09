library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	generic (
		--size of the position counter (in this case 16 positions)
		positions:	integer := 16 														
	);
	port (
		clk:					in			std_logic;
		rst:					in 			std_logic;
		a:						in			std_logic;
		b:						in			std_logic;
		direction:		buffer	std_logic;
		position:			buffer 	integer range 0 to positions-1 := 0
	);
end decoder;

architecture arch of decoder is
	--synchronizer/debounce registers for encoded signal a
	signal	a_new 				:	std_logic_vector(1 downto 0);		
	--synchronizer/debounce registers for encoded signal b
	signal	b_new					:	std_logic_vector(1 downto 0); 	
	--last previous stable value of encoded signal a
	signal	a_prev				:	std_logic;
	--last previous stable value of encoded signal b
	signal	b_prev				:	std_logic;											

begin
	process(clk, rst) begin
		if (rst = '1') then
			position <= 0;
		elsif rising_edge(clk) then
			a_new <= a_new(0) & a;															--add new values of a	
			b_new <= b_new(0) & b;															--add new values of b

			a_prev <= a_new(1);																	--update value of a_prev
			b_prev <= b_new(1);																	--update value of b_prev

			if ((a_prev xor a_new(1)) or (b_prev xor b_new(1))) = '1' then
				direction <= b_prev xor a_new(1);
				if((b_prev xor a_new(1)) = '1') then							--clockwise direction
					if(position < positions-1) then									--not at position limit
						position <= position + 1;											--advance position counter
					else																						--at position limit
						position <= 0;																--position counter to zero
					end if;
				else																							--counter-clockwise direction
					if(position > 0) then														--not at position limit
						position <= position - 1;											--decrement position counter
					else																						--at position limit
						position <= positions-1;	
					end if;																					--counter position to maximum
				end if;
			end if;
		end if;
	end process;
end architecture arch;