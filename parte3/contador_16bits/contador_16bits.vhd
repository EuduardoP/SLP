library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_16bits is
    Port (
        clk   : in  STD_LOGIC; -- Clock global
        reset : in  STD_LOGIC; -- Reset global
        count : out STD_LOGIC_VECTOR (15 downto 0) -- Saída do contador de 16 bits
    );
end contador_16bits;

architecture Structural of contador_16bits is
    -- Sinais internos para as saídas de cada contador de 4 bits e os carries
    signal count0, count1, count2, count3 : STD_LOGIC_VECTOR (3 downto 0);
    signal carry1, carry2, carry3 : STD_LOGIC; -- Carry entre os contadores

    -- Componente do contador binário de 4 bits
    component contador_bin is
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            count : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
begin
    -- Instância do primeiro contador (LSB)
    contador0: contador_bin
        Port map (
            clk => clk,
            reset => reset,
            count => count0
        );

    -- Carry do primeiro contador
    carry1 <= '1' when count0 = "1111" else '0';

    -- Instância do segundo contador
    contador1: contador_bin
        Port map (
            clk => carry1, -- Clock do segundo contador é o carry do primeiro
            reset => reset,
            count => count1
        );

    -- Carry do segundo contador
    carry2 <= '1' when count1 = "1111" else '0';

    -- Instância do terceiro contador
    contador2: contador_bin
        Port map (
            clk => carry2, -- Clock do terceiro contador é o carry do segundo
            reset => reset,
            count => count2
        );

    -- Carry do terceiro contador
    carry3 <= '1' when count2 = "1111" else '0';

    -- Instância do quarto contador (MSB)
    contador3: contador_bin
        Port map (
            clk => carry3, -- Clock do quarto contador é o carry do terceiro
            reset => reset,
            count => count3
        );

    -- Concatenação das saídas
    count <= count3 & count2 & count1 & count0;
end Structural;
