library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And3 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           z : out  STD_LOGIC);
end And3;

architecture Behavioral of And3 is
begin
   z <= a and b and c;
end Behavioral;
