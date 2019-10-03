library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Or2;

architecture Behavioral of Or2 is
begin
   z <= a or b;
end Behavioral;
