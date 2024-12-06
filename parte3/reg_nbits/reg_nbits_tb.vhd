library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg_nbits_tb is
end reg_nbits_tb;

architecture simple of reg_nbits_tb is
    constant N : integer := 16;

    component reg_nbits is
        generic (
            N : integer := 8
        );
        port (
            clk   : in std_logic;
            reset : in std_logic;
            clr   : in std_logic;
            inv   : in std_logic;
            d     : in std_logic;
            q     : out std_logic_vector(N-1 downto 0)
        );
    end component;

    constant CLK_PERIOD : time := 10 ns;
    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal clr   : std_logic := '0';
    signal inv   : std_logic := '0';
    signal d     : std_logic := '0';
    signal q     : std_logic_vector(N-1 downto 0);

begin
    DUT: reg_nbits
        generic map (
            N => N
        )
        port map (
            clk   => clk,
            reset => reset,
            clr   => clr,
            inv   => inv,
            d     => d,
            q     => q
        );

    -- Clock generation
    clk <= not clk after CLK_PERIOD/2;

    process
    begin
        -- Test 1: Reset
        reset <= '1';
        wait for CLK_PERIOD*2;
        reset <= '0';

        -- Test 2: Data shifting
        for i in 0 to 7 loop
            d <= '1';
            wait for CLK_PERIOD;
            d <= '0';
            wait for CLK_PERIOD;
        end loop;
        -- End simulation
        wait for CLK_PERIOD*5;
        assert false report "End of simulation" severity failure;
    end process;

end architecture;
