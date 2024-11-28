library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity majority4_tb is
end majority4_tb;

architecture Behavioral of majority4_tb is
    component majority4
        Port ( 
            x : in STD_LOGIC_VECTOR(3 downto 0);
            y : out STD_LOGIC
        );
    end component;
    
    signal x : STD_LOGIC_VECTOR(3 downto 0);
    signal y : STD_LOGIC;

begin
    uut: majority4 port map (
        x => x,
        y => y
    );

    stim_proc: process
    begin
        -- Test all possible combinations
        x <= "0000"; wait for 10 ns; -- Should output 0
        x <= "0001"; wait for 10 ns; -- Should output 0
        x <= "0011"; wait for 10 ns; -- Should output 0
        x <= "0111"; wait for 10 ns; -- Should output 1
        x <= "1111"; wait for 10 ns; -- Should output 1
        x <= "1110"; wait for 10 ns; -- Should output 1
        x <= "1100"; wait for 10 ns; -- Should output 0
        x <= "1010"; wait for 10 ns; -- Should output 0
        x <= "1011"; wait for 10 ns; -- Should output 1
        
        wait;
    end process;
end Behavioral;
