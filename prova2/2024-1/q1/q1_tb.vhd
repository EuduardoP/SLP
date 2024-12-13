library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q1_tb is
end entity;

architecture simlpe of q1_tb is
  component q1 is
    port (
      clk    : in std_logic;
      rst    : in std_logic;
      hold_n : in std_logic;
      QD     : out std_logic_vector(3 downto 0);
      QU     : out std_logic_vector(3 downto 0);
      S      : out std_logic
    );
  end component;

  constant CLK_PERIOD : time := 10 ns;
  constant RST_PERIOD : time := 800 ns;

  signal clk    : std_logic                    := '0';
  signal reset  : std_logic                    := '0';
  signal hold_n : std_logic                    := '0';
  signal QD     : std_logic_vector(3 downto 0) := (others => '0');
  signal QU     : std_logic_vector(3 downto 0) := (others => '0');
  signal S      : std_logic                    := '0';

begin
  DUT : q1
  port map
  (
    clk    => clk,
    rst    => reset,
    hold_n => hold_n,
    QD     => QD,
    QU     => QU,
    S      => S
  );

  clk   <= not clk after CLK_PERIOD/2;
  reset <= '0', '1' after 30 ns, '0' after 107 ns;
end architecture;