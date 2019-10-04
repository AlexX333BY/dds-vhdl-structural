library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           z : out  STD_LOGIC;
           c : out  STD_LOGIC);
end Add1;

architecture Structural of Add1 is
component And2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Xor2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;
begin
   A1: Xor2 port map (a, b, z);
   A2: And2 port map (a, b, c);
end Structural;
