library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg_nbits is
    generic (
        N : integer := 16
    );
    port (
        clk   : in std_logic;
        reset : in std_logic;
        clr   : in std_logic;
        inv   : in std_logic;
        d     : in std_logic;
        q     : out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture simple of reg_nbits is
    signal reg : std_logic_vector(N-1 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            if clr = '1' then
                reg <= (others => '0');
            elsif inv = '1' then
                reg <= not reg;
            else
                reg <= reg(N-2 downto 0) & d;
            end if;
        end if;
    end process;
    
    q <= reg;
end architecture;
