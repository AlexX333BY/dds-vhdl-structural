library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           ic : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (1 downto 0);
           oc : out  STD_LOGIC);
end Add2;

architecture Structural of Add2 is
component Add1
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          ic : in  STD_LOGIC;
          z : out  STD_LOGIC;
          oc : out  STD_LOGIC);
end component;

component Or2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal c1, c2, c12, z2: STD_LOGIC;
begin
   A1: Add1 port map (a(0), b(0), ic, z(0), c1);
   A2: Add1 port map (a(1), b(1), c1, z(1), oc);
end Structural;

architecture Behavioral of Add2 is
signal z0, c0: STD_LOGIC;
begin
   z0 <= a(0) xor b(0) xor ic;
   c0 <= (a(0) and b(0)) or (a(0) and ic) or (b(0) and ic);
   z(0) <= z0;
   
   z(1) <= a(1) xor b(1) xor c0;
   oc <= (a(1) and b(1)) or ((a(1) xor b(1)) and c0);
end Behavioral;
