library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q2 is
  port (
    clk   : in std_logic;
    reset : in std_logic;

    x : out std_logic_vector(2 downto 0)
  );
end entity;

architecture q2 of q2 is
  signal Q  : std_logic_vector(2 downto 0) := "000";
  signal x3 : std_logic;
begin
  x3 <= (Q(0) xor Q(1)) xor (Q(2) nor Q(1));
  x  <= Q;

  process (clk, reset)
  begin
    if reset = '1' then
      Q <= "000";
    elsif rising_edge(clk) then
      Q(2) <= x3;
      Q(1) <= Q(2);
      Q(0) <= Q(1);
    end if;
  end process;
end architecture;