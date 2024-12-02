library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

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
        for p1 in 0 to 7 loop -- p1 variando de 0 a 7
            x <= std_logic_vector(to_unsigned(p1, 3));
            wait for 10 ns;
        end loop;
        wait;
    end process;  
end Behavioral;
