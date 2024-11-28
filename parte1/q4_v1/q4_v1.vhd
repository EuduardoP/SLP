library ieee;
use ieee.std_logic_1164.all;

entity q4_v1 is
  port (
    i0 : in std_logic;
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    s  : out std_logic
  );
end q4_v1;

architecture simple of q4_v1 is
  signal m1, m2, m3, m4, m5, m6 : std_logic;
begin
  m1 <= (not i0 and not i1 and i2 and i3);
  m2 <= (not i0 and i1 and not i2 and i3);
  m3 <= (not i0 and i1 and i2 and not i3);
  m4 <= (i0 and i1 and not i2 and not i3);
  m5 <= (i0 and not i1 and not i2 and i3);
  m6 <= (i0 and not i1 and i2 and not i3);
  s  <= m1 or m2 or m3 or m4 or m5 or m6;

end architecture;