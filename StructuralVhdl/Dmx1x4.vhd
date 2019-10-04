library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dmx1x4 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           a1 : out  STD_LOGIC;
           b1 : out  STD_LOGIC;
           a2 : out  STD_LOGIC;
           b2 : out  STD_LOGIC);
end Dmx1x4;

architecture Behavioral of Dmx1x4 is
begin
   a1 <= a and not s;
   b1 <= b and not s;
   a2 <= a and s;
   b2 <= b and s;
end Behavioral;

architecture Structural of Dmx1x4 is
component Inv
   Port ( a : in  STD_LOGIC;
          nota : out  STD_LOGIC);
end component;

component And2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal nots: STD_LOGIC;
begin
   D1: Inv port map (s, nots);
   D2: And2 port map (a, nots, a1);
   D3: And2 port map (b, nots, b1);
   D4: And2 port map (a, s, a2);
   D5: And2 port map (b, s, b2);
end Structural;
