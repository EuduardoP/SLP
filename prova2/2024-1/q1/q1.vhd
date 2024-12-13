library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q1 is
  port (
    clk    : in std_logic; -- clock 
    rst    : in std_logic; -- reset
    hold_n : in std_logic; -- para o incremento se for '1'

    QD : out std_logic_vector (3 downto 0); -- dezenas
    QU : out std_logic_vector (3 downto 0); -- unidades
    S  : out std_logic -- saída '1' quando Q igual a 12 ou 56
  );
end entity;

architecture simlpe of q1 is
  signal qu_s : unsigned(3 downto 0) := (others => '0');
  signal qd_s : unsigned(3 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        qu_s <= (others => '0');
        qd_s <= (others => '0');
      elsif hold_n = '0' then
        if qd_s = 7 and qu_s = 3 then
          null;
        elsif qu_s = 9 then
          qu_s <= (others => '0');
          if qd_s = 7 then
            qd_s <= (others => '0');
          else
            qd_s <= qd_s + 1;
          end if;
        else
          qu_s <= qu_s + 1;
        end if;
      end if;
    end if;
  end process;

  process (qd_s, qu_s)
  begin
    if (to_integer(qd_s) = 1 and to_integer(qu_s) = 2) or
      (to_integer(qd_s) = 5 and to_integer(qu_s) = 6) then
      S <= '1';
    else
      S <= '0';
    end if;
  end process;
  QU <= std_logic_vector(qu_s);
  QD <= std_logic_vector(qd_s);
end architecture;