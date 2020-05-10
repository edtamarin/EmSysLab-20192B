LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY testbench IS
  GENERIC (width : positive := 10);
END testbench;

ARCHITECTURE structure OF testbench IS
  COMPONENT testset
    GENERIC (w : positive := 8);
    PORT (data  : OUT  std_logic_vector(w-1 DOWNTO 0));
  END COMPONENT;
  COMPONENT count
    GENERIC (w : positive := 8);
    PORT (a  : IN  std_logic_vector(w-1 DOWNTO 0);
          q : OUT integer RANGE 0 TO w);
  END COMPONENT;

-- local connections
 SIGNAL stimuli : std_logic_vector(width-1 DOWNTO 0);
 SIGNAL output  : integer;
BEGIN
 ts : testset 
      GENERIC MAP (w => width)
      PORT MAP ( data => stimuli);
 dut : count
      GENERIC MAP (w => width)
      PORT MAP ( a => stimuli,      
                 q => output);
END structure;






