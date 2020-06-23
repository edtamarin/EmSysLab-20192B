-- Reading quadrature encoder

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY encoder IS
	-- generic will be used to get index pulse
	GENERIC(rotations : positive :=10;
		positions: integer := 2 ** 8);
	PORT (a,b,rst,clk: IN  std_logic;
		  currentPos : OUT integer range 0 to positions-1;
		  dirOut: out std_logic);
END encoder;

ARCHITECTURE behaviour of encoder IS
	signal a_prev, b_prev, dir: std_logic;
	-- update the position
	function update(cPos:integer;
			dir: std_logic) return integer is
		variable nPos: integer range 0 to positions-1;
	begin
		if dir='1' then
			if cPos=positions-1 then
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
		variable holdTick: std_logic := '0';
	begin
		if rst='1' then
			-- set origin
			current := 0;
			holdTick := '0';
			a_prev <= '0';
			b_prev <= '0';
			dirOut <= '0';
		elsif (clk'event and clk='1') then
			dirOut <= a xor b_prev;
			-- if a signal changes, and no signal changed before it
			if (((a xor a_prev) or (b xor b_prev))='1') and (holdTick='0') then
				current := update(current,a xor b_prev);
				holdTick := '1'; -- encoder busy
			end if;
			-- if both signals low, encoder free
			if (a='0') and (b='0') then
				holdTick := '0';
			end if;
			a_prev <= a;
			b_prev <= b;
		end if;
		currentPos <= current;
	end process;
END behaviour;
