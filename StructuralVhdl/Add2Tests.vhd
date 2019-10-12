LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;

ENTITY Add2Tests IS
END Add2Tests;
 
ARCHITECTURE behavior OF Add2Tests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Add2
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         b : IN  std_logic_vector(1 downto 0);
         ic : IN  std_logic;
         z : OUT  std_logic_vector(1 downto 0);
         oc : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal b : std_logic_vector(1 downto 0) := (others => '0');
   signal ic : std_logic;

 	--Outputs
   signal z_b, z_s : std_logic_vector(1 downto 0);
   signal oc_b, oc_s : std_logic;
   signal z_error, oc_error, error: std_logic;
 
   constant clock_period : time := 10 ns;
   constant a_clock_multiplier : integer := 2 ** 0;
   constant b_clock_multiplier : integer := 2 ** 2;
   constant ic_clock_multiplier : integer := 2 ** 3;
BEGIN
   Add2_b: entity work.Add2(Behavioral) PORT MAP (
          a => a,
          b => b,
          ic => ic,
          z => z_b,
          oc => oc_b
        );

   Add2_s: entity work.Add2(Structural) PORT MAP (
          a => a,
          b => b,
          ic => ic,
          z => z_s,
          oc => oc_s
        );

   z_error <= (z_b(0) xor z_s(0)) or (z_b(1) xor z_s(1));
   oc_error <= oc_b xor oc_s;
   error <= z_error or oc_error;

   a_clock_process :process
   begin
      wait for clock_period*a_clock_multiplier/2;
		a <= a + "1";
   end process;

   b_clock_process :process
   begin
      wait for clock_period*b_clock_multiplier/2;
		b <= b + "1";
   end process;
   
   ic_clock_process :process
   begin
      ic <= '0';
      wait for clock_period*ic_clock_multiplier/2;
		ic <= '1';
      wait for clock_period*ic_clock_multiplier/2;
   end process;
END;
