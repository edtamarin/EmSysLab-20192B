LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY testset IS
  GENERIC (w : positive := 8);
  PORT (data  : OUT  std_logic_vector(w-1 DOWNTO 0));
END testset;

ARCHITECTURE set1 OF testset IS
BEGIN
  PROCESS
  BEGIN
    data <= (others => '0');    -- all zero
    WAIT FOR 10 ns;

    data <= (others => '1');    -- all one
    WAIT FOR 10 ns;

    FOR i IN 0 to 2**w-1 LOOP
      data <= std_logic_vector(to_unsigned(i,w));
      EXIT WHEN i=20; -- if w is large not an exhaustive test is performed
      WAIT FOR 10 ns;
    END LOOP;
    WAIT; -- forever
  END PROCESS;
END set1;






