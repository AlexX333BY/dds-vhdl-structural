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

architecture Behavioral of Mux4 is
component Mux2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          s : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;
begin
   M1: Mux2 port map (a, b, s, z);
   M2: Mux2 port map (a1, b1, s, z1);
end Behavioral;
