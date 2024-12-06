library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity detector is
    port (
       x : in std_logic_vector (3 downto 0); -- vetor de entrada de 4 bits
       y : out std_logic -- saída de 1 bit
        
    );
end entity;

architecture simple of detector is

begin
    process (x)
        variable  count : integer range 0 to 4; -- variável para contar os bit     
    begin
        count := 0; -- inicializa o contador
---------------- incrementa o contador se o bit for '1' ----------------
        for i in 0 to 3 loop
            if x(i)= '1' then
                count := count + 1; -- incrementa o contador se o bit atual for '1'
            end if;
        end loop;
------------------------------------------------------------------------


----------- se houver mais de 2 bits '1', a saída é '1' ----------------
        if count > 2 then
            y <= '1'; -- se o contador for maior que 2, a saída é '1'
        else
            y <= '0'; -- caso contrário, a saída é '0'
        end if;
------------------------------------------------------------------------
    end process;

end architecture;