library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_bin_tb is
end contador_bin_tb;

architecture Behavioral of contador_bin_tb is
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal count : STD_LOGIC_VECTOR (3 downto 0);

    component contador_bin
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            count : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

begin
    uut: contador_bin
        Port map (
            clk => clk,
            reset => reset,
            count => count
        );

    -- Clock Generation
    clk_process: process
    begin
        for i in 0 to 50 loop -- Gera um número limitado de ciclos de clock
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
        wait; -- Para o processo após o número definido de ciclos
    end process;

    -- Stimulus Process
    stimulus_process: process
    begin
        -- Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Reset novamente
        wait for 100 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Deixe o contador funcionar por algum tempo
        wait for 500 ns;

        -- Encerrar a simulação
        wait;
    end process;
end architecture;
