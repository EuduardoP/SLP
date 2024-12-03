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
      y <= (others => '0'); -- se E for '0', todas as saídas são '0'  
    else  
      y <= (others => '0'); -- inicializa todas as saídas como '0'  
      if to_integer(unsigned(x)) < 8 then  
        y(to_integer(unsigned(x))) <= '1'; -- ativa a saída correspondente ao valor de x  
      end if;  
    end if;  
  end process;  
end architecture;