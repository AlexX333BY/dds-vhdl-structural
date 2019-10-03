library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Mux2;

architecture Behavioral of Mux2 is
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

signal nots, anots, bs: STD_LOGIC;
begin
   M1: Inv port map (s, nots);
   M2: And2 port map (a, nots, anots);
   M3: And2 port map (b, s, bs);
   M4: Or2 port map (anots, bs, z);
end Behavioral;
