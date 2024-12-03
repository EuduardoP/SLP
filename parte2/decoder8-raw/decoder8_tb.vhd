library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder8_tb is
end decoder8_tb;

architecture Behavioral of decoder8_tb is
    component decoder8
        Port ( 
            x : in STD_LOGIC_VECTOR(2 downto 0);
            E : in STD_LOGIC;
            y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    signal x : STD_LOGIC_VECTOR(2 downto 0); -- Sinal de entrada de 3 bits
    signal E : STD_LOGIC; -- Sinal de habilitação
    signal y : STD_LOGIC_VECTOR(7 downto 0); -- Sinal de saída de 8 bits

begin
    uut: decoder8 port map (
        x => x,
        E => E,
        y => y
    );

    stim_proc: process
    begin
        -- Teste com E = 0 (desabilitado)
        E <= '0';
        x <= "000"; -- Entrada 0
        wait for 10 ns;
        
        -- Teste com E = 1 (habilitado)
        E <= '1';
        
        -- Testa todas as combinações de entrada
        x <= "000"; -- Entrada 0
        wait for 10 ns;
        x <= "001"; -- Entrada 1
        wait for 10 ns;
        x <= "010"; -- Entrada 2
        wait for 10 ns;
        x <= "011"; -- Entrada 3
        wait for 10 ns;
        x <= "100"; -- Entrada 4
        wait for 10 ns;
        x <= "101"; -- Entrada 5
        wait for 10 ns;
        x <= "110"; -- Entrada 6
        wait for 10 ns;
        x <= "111"; -- Entrada 7
        wait for 10 ns;
        
        wait; -- Espera indefinidamente
    end process;
end architecture;