library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inv is
    Port ( a : in  STD_LOGIC;
           nota : out  STD_LOGIC);
end Inv;

architecture Behavioral of Inv is
begin
   nota <= not a;
end Behavioral;
