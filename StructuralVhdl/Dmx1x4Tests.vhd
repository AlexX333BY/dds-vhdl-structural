LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Dmx1x4Tests IS
END Dmx1x4Tests;
 
ARCHITECTURE behavior OF Dmx1x4Tests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Dmx1x4
    PORT(
         a0 : IN  std_logic;
         a1 : IN  std_logic;
         d : IN  std_logic;
         f0 : OUT  std_logic;
         f1 : OUT  std_logic;
         f2 : OUT  std_logic;
         f3 : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a0 : std_logic := '0';
   signal a1 : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal f0_b, f0_s : std_logic;
   signal f1_b, f1_s : std_logic;
   signal f2_b, f2_s : std_logic;
   signal f3_b, f3_s : std_logic;
   signal f0_error, f2_error, f1_error, f3_error, error: std_logic;
 
   constant clock_period : time := 10 ns;
   constant a0_clock_multiplier : integer := 2 ** 0;
   constant a1_clock_multiplier : integer := 2 ** 1;
   constant d_clock_multiplier : integer := 2 ** 2;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   Dmx1x4_b: entity work.Dmx1x4(Behavioral) PORT MAP (
          a0 => a0,
          a1 => a1,
          d => d,
          f0 => f0_b,
          f1 => f1_b,
          f2 => f2_b,
          f3 => f3_b
        );
        
   Dmx1x4_s: entity work.Dmx1x4(Structural) PORT MAP (
          a0 => a0,
          a1 => a1,
          d => d,
          f0 => f0_s,
          f1 => f1_s,
          f2 => f2_s,
          f3 => f3_s
        );

   f0_error <= f0_b xor f0_s;
   f2_error <= f2_b xor f2_s;
   f1_error <= f1_b xor f1_s;
   f3_error <= f3_b xor f3_s;
   error <= f0_error or f2_error or f1_error or f3_error;
   
   a0_clock_process :process
   begin
		a0 <= '0';
		wait for clock_period*a0_clock_multiplier/2;
		a0 <= '1';
		wait for clock_period*a0_clock_multiplier/2;
   end process;
   
   a1_clock_process :process
   begin
		a1 <= '0';
		wait for clock_period*a1_clock_multiplier/2;
		a1 <= '1';
		wait for clock_period*a1_clock_multiplier/2;
   end process;
   
   d_clock_process :process
   begin
		d <= '0';
		wait for clock_period*d_clock_multiplier/2;
		d <= '1';
		wait for clock_period*d_clock_multiplier/2;
   end process;
END;
