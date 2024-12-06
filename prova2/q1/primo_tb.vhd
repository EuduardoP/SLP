library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity primo_tb is
end entity;

architecture simple of primo_tb is
    component primo is
        port (
            x   : in std_logic_vector (3 downto 0);
            y   : out std_logic
        );
    end component;

    signal x : std_logic_vector (3 downto 0) := "0000";
    signal y : std_logic;
    
begin
    DUT: primo port map(
        x => x,
        y => y
    );

    process
    begin
        for p1 in 0 to 15 loop -- p1 variando de 0 a 15
            x <= std_logic_vector(to_unsigned(p1, 4)); -- Converte p1 para std_logic_vector de 4 bits
            wait for 10 ns; -- Aguarda 10 ns antes da próxima iteração
          end loop; 
          wait; -- Espera indefinidamente após o loop
    end process;
    

end architecture;