library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_BCD_tb is
end entity;

architecture tb of contador_BCD_tb is
    component contador_BCD is
        port(
            saida_BCD     : out std_logic_vector(3 downto 0);
            habilita      : in std_logic;
            ultimo_estado : out std_logic;
            clk           : in std_logic;
            rst           : in std_logic
        );
    end component;

    signal saida_BCD     : std_logic_vector(3 downto 0);
    signal habilita      : std_logic := '0';
    signal ultimo_estado : std_logic;
    signal clk           : std_logic := '0';
    signal rst           : std_logic := '0';

    constant periodo : time := 20 ns;

begin
    DUT: contador_BCD port map(
        saida_BCD     => saida_BCD,
        habilita      => habilita,
        ultimo_estado => ultimo_estado,
        clk           => clk,
        rst           => rst
    );

    -- geramos o sinal de reset
    rst <= '0', '1' after 30 ns, '0' after 107 ns;
    -- geramos o sinal para habilitar a contagem
    habilita <= '1';

    -- geramos o sinal de relógio
    process
    begin
        clk <= '0';
        wait for 20 ns;
        loop
            clk <= '1';
            wait for periodo/2;
            clk <= '0';
            wait for PERIODO/2;
        end loop;
        wait;
    end process;

end architecture;
