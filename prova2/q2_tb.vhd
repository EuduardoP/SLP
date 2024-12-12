library ieee;
use ieee.std_logic_1164.all; -- usamos std_logic e std_logic_vector


entity q2_tb is
end entity;

architecture q2_tb of q2_tb is
  -- declaração do componente que será testado
  component q2 is
    port
    (
      x   : out std_logic_vector(2 downto 0);
      clk : in std_logic;
      rst : in std_logic
    );
  end component;
  -- declaração das constantes e sinais
  constant PERIODO : time := 10 ns;
  signal x         : std_logic_vector(2 downto 0);
  signal clk       : std_logic;
  signal rst       : std_logic;
begin

  -- instanciamos o componente que será testado
  q2_inst : q2
  port map
  (
    x   => x,
    clk => clk,
    rst => rst
  );

  -- geramos o sinal de reset
  rst <= '0', '1' after PERIODO * 3, '0' after PERIODO * 5;

  -- geramos o sinal de de relógio
  gera_clock : process
  begin
    clk <= '0';
    loop
      clk <= '1';
      wait for PERIODO/2;
      clk <= '0';
      wait for PERIODO/2;
    end loop;
  end process;

end architecture;