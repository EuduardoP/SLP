library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder8 is
  port (
    y : out std_logic_vector(7 downto 0);
    x : in std_logic_vector(2 downto 0);
    E : in std_logic
  );
end entity;

architecture simple of decoder8 is
begin
  process (x, E)
  begin
    if E = '0' then
      y <= "00000000";
    else
      case x is
        when "000"  => y  <= "00000001";
        when "001"  => y  <= "00000010";
        when "010"  => y  <= "00000100";
        when "011"  => y  <= "00001000";
        when "100"  => y  <= "00010000";
        when "101"  => y  <= "00100000";
        when "110"  => y  <= "01000000";
        when "111"  => y  <= "10000000";
        when others => y <= "00000000";
      end case;
    end if;
  end process;
end architecture;