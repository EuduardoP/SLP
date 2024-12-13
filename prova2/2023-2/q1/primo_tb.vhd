library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity primo_tb is
end entity;

architecture simple of primo_tb is
component primo is
  port (
    x : in std_logic_vector (3 downto 0);
    e : in std_logic;
    y : out std_logic
  );
end component;

  signal x : std_logic_vector (3 downto 0) := "0000";
  signal e : std_logic := '0';
  signal y : std_logic := '0';
  
  begin
    uut: primo port map (
      e => e,
      x => x,
      y => y
    );
    process
    begin
      wait for 10 ns;
      e <= '1';
      wait for 10 ns;

      for p1 in 0 to 15 loop
        x <= std_logic_vector(to_unsigned(p1,4));
        wait for 10 ns;
      end loop;
      wait;
    end process;
  

end architecture;