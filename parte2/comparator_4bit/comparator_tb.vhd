library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_tb is
end comparator_tb;

architecture Behavioral of comparator_tb is
    component comparator
        Port ( 
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            us : in STD_LOGIC;
            igual : out STD_LOGIC;
            menor : out STD_LOGIC;
            maior : out STD_LOGIC
        );
    end component;
    
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal us, igual, menor, maior : STD_LOGIC;

begin
    uut: comparator port map (
        A => A,
        B => B,
        us => us,
        igual => igual,
        menor => menor,
        maior => maior
    );

    stim_proc: process
    begin
        -- Test unsigned numbers (us = '1')
        us <= '1';
        
        -- Test equal numbers
        A <= "0101"; -- 5
        B <= "0101"; -- 5
        wait for 10 ns;
        
        -- Test A > B
        A <= "1000"; -- 8
        B <= "0100"; -- 4
        wait for 10 ns;
        
        -- Test A < B
        A <= "0011"; -- 3
        B <= "0111"; -- 7
        wait for 10 ns;
        
        -- Test signed numbers (us = '0')
        us <= '0';
        
        -- Test equal negative numbers
        A <= "1100"; -- -4
        B <= "1100"; -- -4
        wait for 10 ns;
        
        -- Test negative < positive
        A <= "1111"; -- -1
        B <= "0001"; -- 1
        wait for 10 ns;
        
        -- Test positive > negative
        A <= "0011"; -- 3
        B <= "1110"; -- -2
        wait for 10 ns;
        
        wait;
    end process;
end Behavioral;
