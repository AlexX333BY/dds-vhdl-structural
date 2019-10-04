library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Combintaional is
    Port ( W : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           G : out  STD_LOGIC);
end Combintaional;

architecture Structural of Combintaional is
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

component And3
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          c : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal WXY, XZ: STD_LOGIC;
begin
   C1: And3 port map (W, X, Y, WXY);
   C2: And2 port map (X, Z, XZ);
   C3: Or2 port map (WXY, XZ, G);
end Structural;

architecture Behavioral of Combintaional is
begin
   G <= (W and X and Y) or (X and Z);
end Behavioral;
