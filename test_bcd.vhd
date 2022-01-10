library ieee;
use ieee.std_logic_1164.all;
ENTITY bcdtestbench IS
END bcdtestbench;
ARCHITECTURE timing OF bcdtestbench IS
SIGNAL A: std_logic_vector (3 downto 0):="0000";
SIGNAL B: std_logic_vector (6 downto 0);
BEGIN
UUT1:ENTITY WORK.bcd (behave) PORT MAP(A);
 
  A<=A+1 AFTER 20 us  WHEN NOW<= 1000 us else"0000"; 
END ARCHITECTURE timing;
