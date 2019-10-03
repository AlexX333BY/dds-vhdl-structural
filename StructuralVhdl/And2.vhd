library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           z : out  STD_LOGIC);
end And2;

architecture Behavioral of And2 is
begin
   z <= a and b;
end Behavioral;
