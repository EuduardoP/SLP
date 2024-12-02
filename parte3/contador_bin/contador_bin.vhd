library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_bin is
    Port (
        clk   : in  STD_LOGIC; -- Clock
        reset : in  STD_LOGIC; -- Reset assíncrono
        count : out STD_LOGIC_VECTOR (3 downto 0) -- Saída do contador
    );
end contador_bin;

architecture Behavioral of contador_bin is
    signal temp_count : UNSIGNED (3 downto 0) := (others => '0'); -- Use UNSIGNED para operações aritméticas
begin
    process (clk, reset)
    begin
        if reset = '1' then
            temp_count <= (others => '0'); -- Reseta o contador
        elsif rising_edge(clk) then
            temp_count <= temp_count + 1; -- Incrementa o contador
        end if;
    end process;

    count <= STD_LOGIC_VECTOR(temp_count); -- Converte para STD_LOGIC_VECTOR para a saída
end architecture;
