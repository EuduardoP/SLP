library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q4_tb is
end entity;

architecture sim of q4_tb is
  component q4 is
    port (
      clk    : in std_logic;
      rst    : in std_logic;
      inc    : in std_logic;
      digit1 : out std_logic_vector(3 downto 0); -- tens
      digit0 : out std_logic_vector(3 downto 0) -- ones
    );
  end component;
  signal clk    : std_logic                    := '0';
  signal rst    : std_logic                    := '0';
  signal inc    : std_logic                    := '1';
  signal digit1 : std_logic_vector(3 downto 0) := "0000";
  signal digit0 : std_logic_vector(3 downto 0) := "0000";
begin
  -- Clock generation
  clk <= not clk after 5 ns;

  -- DUT instantiation
  dut : q4
  port map
  (
    clk    => clk,
    rst    => rst,
    inc    => inc,
    digit1 => digit1,
    digit0 => digit0
  );

  -- Stimulus process
  process
  begin
    -- Reset
    rst <= '1';
    wait for 10 ns;
    rst <= '0';

    -- Count up to 99
    inc <= '1';
    wait for 2000 ns;

    -- Count down to 00
    inc <= '0';
    wait for 2000 ns;

    wait;
  end process;
end architecture;
