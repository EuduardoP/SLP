library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q3 is
  port (
    clk   : in std_logic;
    reset : in std_logic;
    ch    : in std_logic;

    z0 : out std_logic;
    z1 : out std_logic
  );
end entity;

architecture simple of q3 is
  signal Q : std_logic_vector(2 downto 0);
begin

  process (clk, reset)
  begin
    if reset = '1' then
      Q <= (others => '0');
    elsif rising_edge(clk) then
      Q(2) <= Q(1);
      Q(1) <= Q(0);
      Q(0) <= ch;
    end if;
  end process;
  z1 <= not Q(2);
  z0 <= not Q(2) nand Q(0);
end architecture;
