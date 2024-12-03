library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entidade de teste para o detector
entity detector_tb is
end entity;

-- Arquitetura simples para o teste do detector
architecture simple of detector_tb is
  -- Componente do detector a ser testado
  component detector
    port (
      x : in std_logic_vector(3 downto 0); -- Entrada de 4 bits
      y : out std_logic                     -- Saída de 1 bit
    );
  end component;

  -- Sinais para conectar ao componente detector
  signal x : std_logic_vector(3 downto 0); -- Sinal de entrada
  signal y : std_logic;                    -- Sinal de saída
  

begin

  -- Mapeamento do componente detector com os sinais
  uut : detector port map(
    x => x,
    y => y
  );

  -- Processo de estímulo para testar diferentes entradas
  stim_proc: process
  begin
    x <= "0000"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0001"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0010"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0011"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0100"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0101"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0110"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "0111"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1000"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1001"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1010"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1011"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1100"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1101"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1110"; 
    wait for 10 ns; -- Espera 10 ns
    x <= "1111"; 
    wait for 10 ns; -- Espera 10 ns
    wait; -- Espera indefinidamente
  end process;

end architecture;