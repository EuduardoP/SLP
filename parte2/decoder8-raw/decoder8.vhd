library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder8 is
  port (
    y : out std_logic_vector(7 downto 0);  -- Saída do decodificador (8 bits)
    x : in std_logic_vector(2 downto 0);   -- Entrada (3 bits)
    E : in std_logic                         -- Habilitação do decodificador
  );
end entity;

architecture simple of decoder8 is
begin
  process (x, E)
  begin
    if E = '0' then
      y <= "00000000";  -- Se E for 0, a saída é 0
    else
      case x is
        when "000"  => y  <= "00000001";  -- Ativa a saída correspondente ao valor de x
        when "001"  => y  <= "00000010";  -- Ativa a saída correspondente ao valor de x
        when "010"  => y  <= "00000100";  -- Ativa a saída correspondente ao valor de x
        when "011"  => y  <= "00001000";  -- Ativa a saída correspondente ao valor de x
        when "100"  => y  <= "00010000";  -- Ativa a saída correspondente ao valor de x
        when "101"  => y  <= "00100000";  -- Ativa a saída correspondente ao valor de x
        when "110"  => y  <= "01000000";  -- Ativa a saída correspondente ao valor de x
        when "111"  => y  <= "10000000";  -- Ativa a saída correspondente ao valor de x
        when others => y <= "00000000";   -- Caso não corresponda a nenhum valor, a saída é 0
      end case;
    end if;
  end process;
end architecture;