library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_BCD is
    port
    (
        saida_BCD     : out std_logic_vector(3 downto 0); -- saída BCD do contador
        habilita      : in std_logic;                     -- habilita a contagem se ativo
        ultimo_estado : out std_logic;                    -- 1 se as saídas do contador é igual a 99
        clk           : in std_logic;                     -- sinal de relógio
        rst           : in std_logic                      -- sinal de reset assíncrono
    );
end entity;

architecture contador_BCD of contador_BCD is
    signal contador : unsigned(3 downto 0) := (others => '0');
begin

    saida_BCD <= std_logic_vector(contador);

    ultimo_estado <= '1' when (to_integer(contador) = 9) and (habilita = '1') else '0';

    process (clk, rst)
    begin
        if rst = '1' then
            contador <= (others => '0');
        elsif rising_edge(clk) then
            if habilita = '1' then
                if contador = 9 then
                    contador <= (others => '0');
                else
                    contador <= contador + 1;
                end if;
            end if;
        end if;
    end process;

end architecture;
