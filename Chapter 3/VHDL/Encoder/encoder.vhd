-- Reading quadrature encoder

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY encoder IS
	-- generic will be used to get index pulse
	GENERIC(rotations : positive :=10;
		positions: integer :=16);
	PORT (a,b,rst,clk: IN  std_logic;
	      currentPos : OUT integer range 0 to positions-1);
END encoder;

ARCHITECTURE behaviour of encoder IS
	signal a_prev, b_prev, dir, ticked: std_logic;
	function update(cPos:integer;
			dir: std_logic) return integer is
		variable nPos: integer range 0 to positions-1;
	begin
		if dir='1' then
			if cPos=positions then
				nPos := 0;
			else
				nPos := cPos + 1;
			end if;
		else
			if cPos=0 then
				nPos := positions-1;
			else
				nPos := cPos - 1;
			end if;
		end if;
		return nPos;
	end update;
BEGIN
	process(rst,clk)
		variable current: integer range 0 to positions-1 := 0;
	begin
		if rst='1' then
			-- set origin
			current := 0;
			a_prev <= '0';
			b_prev <= '0';
		elsif (clk'event and clk='1') then
			dir <= a xor b_prev;
			ticked <= (a xor a_prev) or (b xor b_prev);
			if ticked='1' then
				current := update(current,dir);
			end if;
			a_prev <= a;
			b_prev <= b;
		end if;
		currentPos <= current;
	end process;
END behaviour;
