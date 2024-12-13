library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q3_tb is
end entity;

architecture testbench of q3_tb is
  component q3 is
    port (
      clk   : in std_logic;
      reset : in std_logic;
      ch    : in std_logic;

      z0 : out std_logic;
      z1 : out std_logic
    );
  end component;

  signal clk   : std_logic := '0';
  signal reset : std_logic := '0';
  signal ch    : std_logic := '0';
  signal z0    : std_logic := '0';
  signal z1    : std_logic := '0';
begin

  clk   <= not clk after 5 ns; -- gerar clock
  reset <= '0', '1' after 10 ns, '0' after 20 ns; --gerar reset

  process_ch : q3
  port map
  (
    clk   => clk,
    reset => reset,
    ch    => ch,
    z0    => z0,
    z1    => z1
  );
  process
    variable count : time := 1 ns;
  begin
    while true loop
      ch <= not ch;
      wait for count;
      count := count + 1 ns;
    end loop;
    wait;
  end process;
end architecture;