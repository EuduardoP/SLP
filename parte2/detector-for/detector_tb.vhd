library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all; 

entity detector_tb is
end entity;

architecture simple of detector_tb is
  component detector
    port (
      x : in std_logic_vector(3 downto 0); -- Entrada de 4 bits
      y : out std_logic -- Saída de 1 bit
    );
  end component;

  signal x : std_logic_vector(3 downto 0); -- Sinal para armazenar a entrada
  signal y : std_logic; -- Sinal para armazenar a saída
  

begin

  uut : detector port map(
    x => x, -- Mapeia o sinal x para a entrada do componente detector
    y => y  -- Mapeia o sinal y para a saída do componente detector
  );

  stim_proc: process
  begin
          for p1 in 0 to 15 loop -- p1 variando de 0 a 15
            x <= std_logic_vector(to_unsigned(p1, 4)); -- Converte p1 para std_logic_vector de 4 bits
            wait for 10 ns; -- Aguarda 10 ns antes da próxima iteração
          end loop; 
          wait; -- Espera indefinidamente após o loop
  end process;

end architecture;