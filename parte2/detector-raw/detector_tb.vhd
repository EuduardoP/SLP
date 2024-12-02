library IEEE;
use IEEE.STD_LOGIC_1164.all;

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
    x <= "0000"; 
    wait for 10 ns;
    x <= "0001"; 
    wait for 10 ns;
    x <= "0010"; 
    wait for 10 ns;
    x <= "0011"; 
    wait for 10 ns;
    x <= "0100"; 
    wait for 10 ns;
    x <= "0101"; 
    wait for 10 ns;
    x <= "0110"; 
    wait for 10 ns;
    x <= "0111"; 
    wait for 10 ns;
    x <= "1000"; 
    wait for 10 ns;
    x <= "1001"; 
    wait for 10 ns;
    x <= "1010"; 
    wait for 10 ns;
    x <= "1011"; 
    wait for 10 ns;
    x <= "1100"; 
    wait for 10 ns;
    x <= "1101"; 
    wait for 10 ns;
    x <= "1110"; 
    wait for 10 ns;
    x <= "1111"; 
    wait for 10 ns;
    wait;
  end process;

end architecture;