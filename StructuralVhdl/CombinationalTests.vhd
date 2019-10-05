LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CombinationalTests IS
END CombinationalTests;
 
ARCHITECTURE behavior OF CombinationalTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Combintaional
    PORT(
         W : IN  std_logic;
         X : IN  std_logic;
         Y : IN  std_logic;
         Z : IN  std_logic;
         G : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal W : std_logic := '0';
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
   signal Z : std_logic := '0';

 	--Outputs
   signal G_s, G_b, error : std_logic;
 
   constant clock_period : time := 10 ns;
   constant w_clock_multiplier : integer := 2 ** 0;
   constant x_clock_multiplier : integer := 2 ** 1;
   constant y_clock_multiplier : integer := 2 ** 2;
   constant z_clock_multiplier : integer := 2 ** 3;    
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   Combinational_b: entity work.Combintaional(Behavioral) PORT MAP (
          W => W,
          X => X,
          Y => Y,
          Z => Z,
          G => G_b
        );
   
   Combinational_s: entity work.Combintaional(Structural) PORT MAP (
          W => W,
          X => X,
          Y => Y,
          Z => Z,
          G => G_s
        );

   error <= G_b xor G_s;

   w_clock_process :process
   begin
		W <= '0';
		wait for clock_period*w_clock_multiplier/2;
		W <= '1';
		wait for clock_period*w_clock_multiplier/2;
   end process;
   
   x_clock_process :process
   begin
		X <= '0';
		wait for clock_period*x_clock_multiplier/2;
		X <= '1';
		wait for clock_period*x_clock_multiplier/2;
   end process;

   y_clock_process :process
   begin
		Y <= '0';
		wait for clock_period*y_clock_multiplier/2;
		Y <= '1';
		wait for clock_period*y_clock_multiplier/2;
   end process;

   z_clock_process :process
   begin
		Z <= '0';
		wait for clock_period*z_clock_multiplier/2;
		Z <= '1';
		wait for clock_period*z_clock_multiplier/2;
   end process;
END;
