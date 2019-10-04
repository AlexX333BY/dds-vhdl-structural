library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC;
           z1 : out  STD_LOGIC);
end Mux4;

architecture Structural of Mux4 is
component Inv
   Port ( a : in  STD_LOGIC;
          nota : out  STD_LOGIC);
end component;

component And2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Or2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal nots, anots, bs, a1nots, b1s: STD_LOGIC;
begin
   M1: Inv port map (s, nots);

   M2: And2 port map (a, nots, anots);
   M3: And2 port map (b, s, bs);
   M4: Or2 port map (anots, bs, z);

   M5: And2 port map (a1, nots, a1nots);
   M6: And2 port map (b1, s, b1s);
   M7: Or2 port map (a1nots, b1s, z1);
end Structural;
