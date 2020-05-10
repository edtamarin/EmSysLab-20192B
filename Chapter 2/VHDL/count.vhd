LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY count IS
  GENERIC (w : positive := 8);
  PORT (a  : IN  std_logic_vector(w-1 DOWNTO 0);
        q : OUT integer RANGE 0 TO w);
END count;

ARCHITECTURE behaviour OF count IS
  FUNCTION cnt (a:std_logic_vector) RETURN integer IS
    VARIABLE nmb : INTEGER RANGE 0 TO a'LENGTH;
  BEGIN
    nmb := 0;
    FOR i IN a'RANGE LOOP
      IF a(i)='1' THEN nmb:=nmb+1; END IF;
    END LOOP;
    RETURN nmb;
  END cnt;
BEGIN
  q <= cnt(a);
END behaviour;






