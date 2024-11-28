library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ula1_tb is
end ula1_tb;

architecture Behavioral of ula1_tb is
    component ula1
        Port ( 
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            CONTROLE : in STD_LOGIC_VECTOR(1 downto 0);
            C : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    signal A, B : STD_LOGIC_VECTOR(7 downto 0);
    signal CONTROLE : STD_LOGIC_VECTOR(1 downto 0);
    signal C : STD_LOGIC_VECTOR(7 downto 0);

begin
    uut: ula1 port map (
        A => A,
        B => B,
        CONTROLE => CONTROLE,
        C => C
    );

    stim_proc: process
    begin
        -- Test Addition (00)
        A <= "00001100";  -- 12
        B <= "00000011";  -- 3
        CONTROLE <= "00";
        wait for 10 ns;
        
        -- Test Subtraction (01)
        A <= "00001100";  -- 12
        B <= "00000011";  -- 3
        CONTROLE <= "01";
        wait for 10 ns;
        
        -- Test AND operation (10)
        A <= "11110000";
        B <= "00111100";
        CONTROLE <= "10";
        wait for 10 ns;
        
        -- Test Zero output (11)
        A <= "11111111";
        B <= "11111111";
        CONTROLE <= "11";
        wait for 10 ns;
        
        wait;
    end process;
end Behavioral;
