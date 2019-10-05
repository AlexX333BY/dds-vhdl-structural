LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
 
ENTITY And5Tests IS
END And5Tests;
 
ARCHITECTURE behavior OF And5Tests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT And5
    PORT(
         a : IN  std_logic_vector(4 downto 0);
         z : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal z_b, z_s : std_logic;
   signal error: std_logic;
   
   constant clock_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   And5_b: entity work.And5(Behavioral) PORT MAP (
          a => a,
          z => z_b
        );

   And5_s: entity work.And5(Structural) PORT MAP (
          a => a,
          z => z_s
        );

   error <= z_b xor z_s;

   a_clock_process :process
   begin
      wait for clock_period/2;
		a <= a + "1";
   end process;
END;
