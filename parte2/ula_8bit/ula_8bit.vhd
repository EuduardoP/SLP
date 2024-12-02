library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity ula_8bit is
  port (
    A        : in std_logic_vector(7 downto 0);
    B        : in std_logic_vector(7 downto 0);
    CONTROLE : in std_logic_vector(1 downto 0);

    C : out std_logic_vector(7 downto 0)
  );
end entity;

architecture simple of ula_8bit is

begin

  process (A, B, CONTROLE)
  begin
    case CONTROLE is
      when "00" =>
        C <= std_logic_vector(unsigned(A) + unsigned(B));

      when "01" =>
        C <= std_logic_vector(unsigned(A) - unsigned(B));

      when "10" =>
        C <= A and B;

      when "11" =>
        C <= "00000000";

      when others =>
        null;
    end case;

  end process;

end architecture;