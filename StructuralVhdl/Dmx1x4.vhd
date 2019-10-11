library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dmx1x4 is
    Port ( a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           d : in  STD_LOGIC;
           f0 : out  STD_LOGIC;
           f1 : out  STD_LOGIC;
           f2 : out  STD_LOGIC;
           f3 : out  STD_LOGIC);
end Dmx1x4;

architecture Behavioral of Dmx1x4 is
begin
   f0 <= d and not a0 and not a1;
   f1 <= d and a0 and not a1;
   f2 <= d and not a0 and a1;
   f3 <= d and a0 and a1;
end Behavioral;

architecture Structural of Dmx1x4 is
component Inv
   Port ( a : in  STD_LOGIC;
          nota : out  STD_LOGIC);
end component;

component And3
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          c : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal nota0, nota1: STD_LOGIC;
begin
   D0: Inv port map (a0, nota0);
   D1: Inv port map (a1, nota1);
   D2: And3 port map (d, nota0, nota1, f0);
   D3: And3 port map (d, a0, nota1, f1);
   D4: And3 port map (d, nota0, a1, f2);
   D5: And3 port map (d, a0, a1, f3);
end Structural;
