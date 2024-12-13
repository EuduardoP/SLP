library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q4 is
  port (
    clk    : in std_logic;
    rst    : in std_logic;
    inc    : in std_logic;
    digit1 : out std_logic_vector(3 downto 0); -- tens
    digit0 : out std_logic_vector(3 downto 0) -- ones
  );
end entity;

architecture rtl of q4 is
  signal ones, tens : unsigned(3 downto 0);
begin
  process (clk, rst)
  begin
    if rst = '1' then
      ones <= (others => '0');
      tens <= (others => '0');
    elsif rising_edge(clk) then
      if inc = '1' then
        -- Count up
        if ones = 9 then
          ones <= (others => '0');
          if tens = 9 then
            tens <= (others => '0');
          else
            tens <= tens + 1;
          end if;
        else
          ones <= ones + 1;
        end if;
      else
        -- Count down
        if ones = 0 then
          ones <= to_unsigned(9, 4);
          if tens = 0 then
            tens <= to_unsigned(9, 4);
          else
            tens <= tens - 1;
          end if;
        else
          ones <= ones - 1;
        end if;
      end if;
    end if;
  end process;

  digit1 <= std_logic_vector(tens);
  digit0 <= std_logic_vector(ones);
end architecture;
