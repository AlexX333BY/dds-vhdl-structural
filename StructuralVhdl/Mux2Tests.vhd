LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Mux2Tests IS
END Mux2Tests;
 
ARCHITECTURE behavior OF Mux2Tests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Mux2
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         s : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal s : std_logic := '0';

 	--Outputs
   signal err, z_s, z_b : std_logic;
 
   constant clock_period : time := 10 ns;
   constant a_clock_multiplier : integer := 2 ** 0;
   constant b_clock_multiplier : integer := 2 ** 1;
   constant s_clock_multiplier : integer := 2 ** 2; 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   Mux2_s: entity work.Mux2(Structural) PORT MAP (
          a => a,
          b => b,
          s => s,
          z => z_s
        );
        
   Mux2_b: entity work.Mux2(Behavioral) PORT MAP (
          a => a,
          b => b,
          s => s,
          z => z_b
        );

   err <= z_s xor z_b;
   
   a_clock_process :process
   begin
		a <= '0';
		wait for clock_period*a_clock_multiplier/2;
		a <= '1';
		wait for clock_period*a_clock_multiplier/2;
   end process;
   
   b_clock_process :process
   begin
		b <= '0';
		wait for clock_period*b_clock_multiplier/2;
		b <= '1';
		wait for clock_period*b_clock_multiplier/2;
   end process;
   
   s_clock_process :process
   begin
		s <= '0';
		wait for clock_period*s_clock_multiplier/2;
		s <= '1';
		wait for clock_period*s_clock_multiplier/2;
   end process;
END;
