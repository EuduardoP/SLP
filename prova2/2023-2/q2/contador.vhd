library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
  port (
    clk   : in std_logic;
    reset : in std_logic;
    x     : out std_logic_vector (2 downto 0)
  );
end entity;

architecture simple of contador is
  signal Q  : std_logic_vector (2 downto 0) := "111";
  signal x3 : std_logic                     := '0';

begin
  x3 <= (Q(0) xor Q(1)) xor (Q(2) nor Q(1));
  x  <= Q;

  process (clk, reset)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        Q <= "000";
      else
        Q <= x3 & Q(2 downto 1);
      end if;
    end if;
  end process;
end architecture;