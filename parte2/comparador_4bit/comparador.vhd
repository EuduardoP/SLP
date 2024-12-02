library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity comparador is
  port (
    A     : in std_logic_vector(3 downto 0);
    B     : in std_logic_vector(3 downto 0);
    us    : in std_logic; -- '0' for signed, '1' for unsigned
    igual : out std_logic;
    menor : out std_logic;
    maior : out std_logic
  );
end entity;

architecture simple of comparador is
begin
  process (A, B, us)
    variable a_int, b_int : integer;
  begin

    ----- utiliza binário com sinal ou não dependendo de us -----
    if us = '1' then
      a_int := to_integer(unsigned(A));
      b_int := to_integer(unsigned(B));
    else
      a_int := to_integer(signed(A));
      b_int := to_integer(signed(B));
    end if;

    ----- Compare valores -----
    if a_int = b_int then
      igual <= '1';
      menor <= '0';
      maior <= '0';
    elsif a_int > b_int then
      igual <= '0';
      menor <= '0';
      maior <= '1';
    else
      igual <= '0';
      menor <= '1';
      maior <= '0';
    end if;
  end process;

end architecture;