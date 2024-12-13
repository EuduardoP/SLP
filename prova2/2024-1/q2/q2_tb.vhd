library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q2_tb is
end entity;

architecture simple of q2_tb is
  component q2 is
    port (
      clk   : in std_logic;
      reset : in std_logic;
      x     : out std_logic_vector (2 downto 0)
    );
  end component;

  signal clk   : std_logic                     := '0';
  signal reset : std_logic                     := '0';
  signal x     : std_logic_vector (2 downto 0) := "000";

begin

  reset <= '0', '1' after 30 ns, '0' after 50 ns;
  clk   <= not clk after 10 ns;

  uut : q2
  port map
  (
    clk   => clk,
    reset => reset,
    x     => x
  );

end architecture;