library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_4digits_tb is
end entity;

architecture tb of BCD_4digits_tb is
    component BCD_4digits is
        port (
            saida_BCD1    : out std_logic_vector(3 downto 0);
            saida_BCD2    : out std_logic_vector(3 downto 0);
            saida_BCD3    : out std_logic_vector(3 downto 0);
            saida_BCD4    : out std_logic_vector(3 downto 0);
            habilita      : in std_logic;
            ultimo_estado : out std_logic;
            clk           : in std_logic;
            rst           : in std_logic
        );
    end component;

    signal saida_BCD1    : std_logic_vector(3 downto 0);
    signal saida_BCD2    : std_logic_vector(3 downto 0);
    signal saida_BCD3    : std_logic_vector(3 downto 0);
    signal saida_BCD4    : std_logic_vector(3 downto 0);
    signal habilita      : std_logic := '0';
    signal ultimo_estado : std_logic;
    signal clk           : std_logic := '0';
    signal rst           : std_logic := '0';

    constant periodo : time := 20 ns;

begin
    DUT: BCD_4digits port map(
        saida_BCD1    => saida_BCD1,
        saida_BCD2    => saida_BCD2,
        saida_BCD3    => saida_BCD3,
        saida_BCD4    => saida_BCD4,
        habilita      => habilita,
        ultimo_estado => ultimo_estado,
        clk           => clk,
        rst           => rst
    );

    -- Reset signal
    rst <= '0', '1' after 30 ns, '0' after 107 ns;
    -- Enable counting
    habilita <= '1';

    -- Clock generation
    process
    begin
        clk <= '0';
        wait for 20 ns;
        loop
            clk <= '1';
            wait for periodo/2;
            clk <= '0';
            wait for periodo/2;
        end loop;
        wait;
    end process;

end architecture;
