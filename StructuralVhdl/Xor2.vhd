library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Xor2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Xor2;

architecture Behavioral of Xor2 is
begin
   z <= a xor b;
end Behavioral;
