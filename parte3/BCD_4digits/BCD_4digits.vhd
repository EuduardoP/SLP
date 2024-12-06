library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_4digits is
    port (
        saida_BCD1    : out std_logic_vector(3 downto 0); -- unidade
        saida_BCD2    : out std_logic_vector(3 downto 0); -- dezena
        saida_BCD3    : out std_logic_vector(3 downto 0); -- centena
        saida_BCD4    : out std_logic_vector(3 downto 0); -- milhar
        habilita      : in std_logic;
        ultimo_estado : out std_logic; -- 1 quando contador chegar a 9999
        clk           : in std_logic;
        rst           : in std_logic
    );
end entity;

architecture BCD_4digits of BCD_4digits is
    component contador_BCD is
        port (
            saida_BCD     : out std_logic_vector(3 downto 0);
            habilita      : in std_logic;
            ultimo_estado : out std_logic;
            clk           : in std_logic;
            rst           : in std_logic
        );
    end component;

    signal ultimo1, ultimo2, ultimo3, ultimo4 : std_logic;
    signal hab2, hab3, hab4 : std_logic;
begin
    -- Unidade
    cont1: contador_BCD port map(
        saida_BCD     => saida_BCD1,
        habilita      => habilita,
        ultimo_estado => ultimo1,
        clk           => clk,
        rst           => rst
    );

    -- Dezena
    hab2 <= ultimo1 and habilita;
    cont2: contador_BCD port map(
        saida_BCD     => saida_BCD2,
        habilita      => hab2,
        ultimo_estado => ultimo2,
        clk           => clk,
        rst           => rst
    );

    -- Centena
    hab3 <= ultimo2 and hab2;
    cont3: contador_BCD port map(
        saida_BCD     => saida_BCD3,
        habilita      => hab3,
        ultimo_estado => ultimo3,
        clk           => clk,
        rst           => rst
    );

    -- Milhar
    hab4 <= ultimo3 and hab3;
    cont4: contador_BCD port map(
        saida_BCD     => saida_BCD4,
        habilita      => hab4,
        ultimo_estado => ultimo4,
        clk           => clk,
        rst           => rst
    );

    -- Ultimo estado (9999)
    ultimo_estado <= ultimo4 and hab4;

end architecture;
