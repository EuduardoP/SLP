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
    
    signal x : STD_LOGIC_VECTOR(2 downto 0);
    signal E : STD_LOGIC;
    signal y : STD_LOGIC_VECTOR(7 downto 0);

begin
    uut: decoder8 port map (
        x => x,
        E => E,
        y => y
    );

    stim_proc: process
    begin
        -- Test with E = 0 (disabled)
        E <= '0';
        x <= "000";
        wait for 10 ns;
        
        -- Test with E = 1 (enabled)
        E <= '1';
        
        -- Test all input combinations
        x <= "000";
        wait for 10 ns;
        x <= "001";
        wait for 10 ns;
        x <= "010";
        wait for 10 ns;
        x <= "011";
        wait for 10 ns;
        x <= "100";
        wait for 10 ns;
        x <= "101";
        wait for 10 ns;
        x <= "110";
        wait for 10 ns;
        x <= "111";
        wait for 10 ns;
        
        wait;
    end process;
end Behavioral;
