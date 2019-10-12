library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           ic : in  STD_LOGIC;
           z : out  STD_LOGIC;
           oc : out  STD_LOGIC);
end Add1;

architecture Structural of Add1 is
component And2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Xor2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Or2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;
signal z_in, c_in, c_c: STD_LOGIC;
begin
   A1: Xor2 port map (a, b, z_in);
   A2: And2 port map (a, b, c_in);
   A3: Xor2 port map (z_in, ic, z);
   A4: And2 port map (z_in, ic, c_c);
   A5: Or2 port map (c_in, c_c, oc);
end Structural;
