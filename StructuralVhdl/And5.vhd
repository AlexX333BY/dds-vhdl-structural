library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And5 is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           z : out  STD_LOGIC);
end And5;

architecture Behavioral of And5 is
begin
   z <= '1' when a="11111" else '0';
end Behavioral;

architecture Structural of And5 is
component And2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Buf
   Port ( a : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal gen: std_logic_vector(3 downto 0);
begin
   GEN_0: And2 port map (a(0), a(1), gen(0));
   GEN_LOOP: for i in 1 to 3 generate
      GEN_I: And2 port map (gen(i-1), a(i+1), gen(i));
   end generate;
   RES: Buf port map (gen(3), z);
end Structural;
