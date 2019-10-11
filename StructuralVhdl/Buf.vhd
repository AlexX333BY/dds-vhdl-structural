library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Buf is
    Port ( a : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Buf;

architecture Behavioral of Buf is
begin
   z <= a;
end Behavioral;
