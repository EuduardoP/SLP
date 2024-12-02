library IEEE;  
use IEEE.STD_LOGIC_1164.all;  
use ieee.numeric_std.all;  

entity decoder8 is  
  port (  
    y : out std_logic_vector(7 downto 0); -- vetor de saída de 8 bits  
    x : in std_logic_vector(2 downto 0); -- vetor de entrada de 3 bits  
    E : in std_logic -- sinal de habilitação  
  );  
end entity;  

architecture simple of decoder8 is  
begin  
  process (x, E)  
  begin  
    if E = '0' then  
      y <= std_logic_vector(to_unsigned(0, 7)); -- se E for '0', todas as saídas são '0'  
    else  
      y <= (others => '0'); -- inicializa todas as saídas como '0'  
      for i in 0 to 7 loop  
        if x = std_logic_vector(to_unsigned(i, 3)) then  
          y(i) <= '1'; -- ativa a saída correspondente ao valor de x  
        end if;  
      end loop;  
    end if;  
  end process;  
end architecture;