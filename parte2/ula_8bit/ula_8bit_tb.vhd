library IEEE;  
use IEEE.STD_LOGIC_1164.all;  
use ieee.numeric_std.all;

entity ula_8bit_tb is
end entity;

architecture simple of ula_8bit_tb is
    component ula_8bit is
        port (
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            CONTROLE : in STD_LOGIC_VECTOR(1 downto 0);
            C : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal A, B: STD_LOGIC_VECTOR(7 downto 0);
    signal CONTROLE : STD_LOGIC_VECTOR(1 downto 0);
    signal C : STD_LOGIC_VECTOR(7 downto 0);
begin
    uut: ula_8bit port map (
        A => A,
        B => B,
        CONTROLE => CONTROLE,
        C => C
    );

    stim_proc: process
    begin
         -- Teste de adição (00)
         A <= "00001100";  -- 12
         B <= "00000011";  -- 3
         CONTROLE <= "00";
         wait for 10 ns;
         
         -- Teste de subtração (01)
         A <= "00001100";  -- 12
         B <= "00000011";  -- 3
         CONTROLE <= "01";
         wait for 10 ns;
         
         -- Teste de AND (10)
         A <= "11110000"; -- 240
         B <= "00111100"; -- 60
         CONTROLE <= "10";
         wait for 10 ns;
         
         -- Teste de zero output (11)
         A <= "11111111"; -- 255
         B <= "11111111"; -- 255
         CONTROLE <= "11";
         wait for 10 ns;
         
         wait;
    end process;
    

end architecture;