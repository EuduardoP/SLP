library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity majority4 is
    Port ( 
        x : in STD_LOGIC_VECTOR(3 downto 0);
        y : out STD_LOGIC
    );
end majority4;

architecture Behavioral of majority4 is
begin
    process(x)
        variable count : integer range 0 to 4;
    begin
        count := 0;
        
        for i in 0 to 3 loop
            if x(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        
        if count > 2 then
            y <= '1';
        else
            y <= '0';
        end if;
    end process;
end Behavioral;
