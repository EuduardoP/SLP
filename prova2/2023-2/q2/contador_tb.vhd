library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_tb is
end entity;

architecture simple of contador_tb is
  component contador is
    port (
      clk   : in std_logic;
      reset : in std_logic;
      x     : out std_logic_vector (2 downto 0);
      S     : out std_logic
    );
  end component;

  signal clk   : std_logic                     := '0';
  signal reset : std_logic                     := '0';
  signal x     : std_logic_vector (2 downto 0) := "000";
  signal S     : std_logic                     := '0';

begin

  reset <= '0', '1' after 30 ns, '0' after 50 ns;

  uut : contador
  port map
  (
    clk   => clk,
    reset => reset,
    x     => x,
    S     => S
  );
  process
  begin
    while true loop
      clk <= '1';
      wait for 10 ns;
      clk <= '0';
      wait for 10 ns;
    end loop;
    wait;
  end process;
end architecture;