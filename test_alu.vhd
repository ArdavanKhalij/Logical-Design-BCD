library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
ENTITY alutestbench IS
END alutestbench;
ARCHITECTURE timing OF alutrstbench IS
SIGNAL s: std_logic_vector (3 downto 0):"0000";
SIGNAL A:std_logic_vector (7 downto 0):"00000000";
SIGNAL  B: std_logic_vector (7 downto 0):"00000000";
SIGNAL Cin:std_logic;
SIGNAL Z:Std_logic_vector (7 downto 0);
SIGNAL cout: out std_logic;
SIGNAL zero: out std_logic;
SIGNAL overflow: out std_logic;
SIGNAL halfcarry: out std_logic;
SIGNAL sign: out std_logic);
BEGIN
UUT1:ENTITY WORK.mux (behave)PORT MAP(s,A,B,Cin);

END ARCHITECTURE timing;
 