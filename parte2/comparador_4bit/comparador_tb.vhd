library IEEE;  
use IEEE.STD_LOGIC_1164.all;  
use ieee.numeric_std.all;

entity comparador_tb is
end entity;

architecture simple of comparador_tb is
    component comparador
        Port (
            A     : in std_logic_vector(3 downto 0);
            B     : in std_logic_vector(3 downto 0);
            us    : in std_logic; -- '0' com sinal, '1' sem sinal
            igual : out std_logic;
            menor : out std_logic;
            maior : out std_logic
        );
    end component;

    signal A, B : STD_LOGIC_VECTOR (3 downto 0); -- Sinais de entrada A e B
    signal us, igual, menor, maior : STD_LOGIC; -- Sinais de controle e saída
    
begin
    uut: comparador port map (
        A => A,
        B => B,
        us => us,
        igual => igual,
        menor => menor,
        maior => maior
    );

    stim_proc: process
    begin
        --- testando sem sinal ---
        us <= '1'; -- Define o modo sem sinal

        --- testando igualdade ---
        A <= "0101"; -- A recebe 5
        B <= "0101"; -- B recebe 5
        wait for 10 ns; -- Aguarda 10 ns

        --- testando A > B ---
        A <= "1000"; -- A recebe 8
        B <= "0100"; -- B recebe 4
        wait for 10 ns; -- Aguarda 10 ns

        --- testando A < B ---
        A <= "0011"; -- A recebe 3
        B <= "1111"; -- B recebe 7
        wait for 10 ns; -- Aguarda 10 ns

        --- testando com sinal ---
        us <= '0'; -- Define o modo com sinal

        --- testando igualdade ---
        A <= "1001"; -- A recebe 5
        B <= "1001"; -- B recebe 5
        wait for 10 ns; -- Aguarda 10 ns

        --- testando A > B ---
        A <= "1111"; -- A recebe -1
        B <= "1100"; -- B recebe -4
        wait for 10 ns; -- Aguarda 10 ns

        --- testando A < B ---
        A <= "1000"; -- A recebe -8
        B <= "1011"; -- B recebe -5
        wait for 10 ns; -- Aguarda 10 ns
        wait; -- Finaliza o processo
    end process;
    

end architecture;