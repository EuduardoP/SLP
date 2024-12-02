library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all; 

entity detector_tb is
end entity;

architecture simple of detector_tb is
  component detector
    port (
      x : in std_logic_vector(3 downto 0);
      y : out std_logic
    );
  end component;

  signal x : std_logic_vector(3 downto 0);
  signal y : std_logic;
  

begin

  uut : detector port map(
    x => x,
    y => y
  );

  stim_proc: process
  begin
          for p1 in 0 to 15 loop -- p1 variando de 0 a 15
            x <= std_logic_vector(to_unsigned(p1, 4)); 
            wait for 10 ns;
          end loop; 
          wait;
  end process;

end architecture;