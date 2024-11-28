library ieee;
use ieee.std_logic_1164.all;

entity q4_v1_tb is
end q4_v1_tb;

architecture simple of q4_v1_tb is
  -- Declaração do componente a ser testado
  component q4_v1
    port (
      i0, i1, i2, i3 : in std_logic;
      s              : out std_logic
    );
  end component;

  -- Declaração de sinais para interconexão
  signal i0, i1, i2, i3 : std_logic;
  signal s              : std_logic;
begin
    -- Instanciação do componente
    dut : q4_v1 port map (
      i0 => i0,
      i1 => i1,
      i2 => i2,
      i3 => i3,
      s  => s
    );

    process
    begin
      -- Caso de teste 1
      i0 <= '0';
      i1 <= '0';
      i2 <= '0';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 2
      i0 <= '0';
      i1 <= '0';
      i2 <= '0';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 3
      i0 <= '0';
      i1 <= '0';
      i2 <= '1';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 4
      i0 <= '0';
      i1 <= '0';
      i2 <= '1';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 5
      i0 <= '0';
      i1 <= '1';
      i2 <= '0';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 6
      i0 <= '0';
      i1 <= '1';
      i2 <= '0';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 7
      i0 <= '0';
      i1 <= '1';
      i2 <= '1';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 8
      i0 <= '0';
      i1 <= '1';
      i2 <= '1';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 9
      i0 <= '1';
      i1 <= '0';
      i2 <= '0';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 10
      i0 <= '1';
      i1 <= '0';
      i2 <= '0';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 11
      i0 <= '1';
      i1 <= '0';
      i2 <= '1';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 12
      i0 <= '1';
      i1 <= '0';
      i2 <= '1';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 13
      i0 <= '1';
      i1 <= '1';
      i2 <= '0';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 14
      i0 <= '1';
      i1 <= '1';
      i2 <= '0';
      i3 <= '1';
      wait for 10 ns;

      -- Caso de teste 15
      i0 <= '1';
      i1 <= '1';
      i2 <= '1';
      i3 <= '0';
      wait for 10 ns;

      -- Caso de teste 16
      i0 <= '1';
      i1 <= '1';
      i2 <= '1';
      i3 <= '1';
      wait for 10 ns;

      -- Finaliza o processo
      wait;
    end process;
end architecture;