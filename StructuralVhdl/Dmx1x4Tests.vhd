LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Dmx1x4Tests IS
END Dmx1x4Tests;
 
ARCHITECTURE behavior OF Dmx1x4Tests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Dmx1x4
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         s : IN  std_logic;
         a1 : OUT  std_logic;
         b1 : OUT  std_logic;
         a2 : OUT  std_logic;
         b2 : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal s : std_logic := '0';

 	--Outputs
   signal a1_b, a1_s : std_logic;
   signal b1_b, b1_s : std_logic;
   signal a2_b, a2_s : std_logic;
   signal b2_b, b2_s : std_logic;
   signal a1_error, a2_error, b1_error, b2_error, error: std_logic;
 
   constant clock_period : time := 10 ns;
   constant a_clock_multiplier : integer := 2 ** 0;
   constant b_clock_multiplier : integer := 2 ** 1;
   constant s_clock_multiplier : integer := 2 ** 2;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   Dmx1x4_b: entity work.Dmx1x4(Behavioral) PORT MAP (
          a => a,
          b => b,
          s => s,
          a1 => a1_b,
          b1 => b1_b,
          a2 => a2_b,
          b2 => b2_b
        );
        
   Dmx1x4_s: entity work.Dmx1x4(Structural) PORT MAP (
          a => a,
          b => b,
          s => s,
          a1 => a1_s,
          b1 => b1_s,
          a2 => a2_s,
          b2 => b2_s
        );

   a1_error <= a1_b xor a1_s;
   a2_error <= a2_b xor a2_s;
   b1_error <= b1_b xor b1_s;
   b2_error <= b2_b xor b2_s;
   error <= a1_error or a2_error or b1_error or b2_error;
   
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
