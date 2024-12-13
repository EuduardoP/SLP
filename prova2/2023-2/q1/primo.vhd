library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity primo is
    port (
        x   : in std_logic_vector (3 downto 0); -- Sinal de entrada
        e   : in std_logic; -- enable
        y   : out std_logic -- saída
    );
end entity;

architecture simple of primo is
    signal m1, m2, m3, m4 : std_logic;
begin
    m1 <= (not x(3) and not x(2) and x(1));
    m2 <= (not x(3) and     x(2) and x(0));
    m3 <= (    x(2) and not x(1) and x(0));
    m4 <= (not x(2) and     x(1) and x(0));
    y <= e and (m1 or m2 or m3 or m4);

end architecture;