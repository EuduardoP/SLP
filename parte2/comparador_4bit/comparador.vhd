library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity comparador is
  port (
    A     : in std_logic_vector(3 downto 0); -- Entrada A de 4 bits
    B     : in std_logic_vector(3 downto 0); -- Entrada B de 4 bits
    us    : in std_logic; -- '0' para sinalizado, '1' para não sinalizado
    igual : out std_logic; -- Saída que indica se A é igual a B
    menor : out std_logic; -- Saída que indica se A é menor que B
    maior : out std_logic  -- Saída que indica se A é maior que B
  );
end entity;

architecture simple of comparador is
begin
  process (A, B, us)
    variable a_int, b_int : integer; -- Variáveis para armazenar os valores inteiros convertidos
  begin

    ----- utiliza binário com sinal ou não dependendo de us -----
    if us = '1' then
      a_int := to_integer(unsigned(A)); -- Converte A para inteiro não sinalizado
      b_int := to_integer(unsigned(B)); -- Converte B para inteiro não sinalizado
    else
      a_int := to_integer(signed(A)); -- Converte A para inteiro sinalizado
      b_int := to_integer(signed(B)); -- Converte B para inteiro sinalizado
    end if;

    ----- Compare valores -----
    if a_int = b_int then
      igual <= '1'; -- A é igual a B
      menor <= '0'; -- A não é menor que B
      maior <= '0'; -- A não é maior que B
    elsif a_int > b_int then
      igual <= '0'; -- A não é igual a B
      menor <= '0'; -- A não é menor que B
      maior <= '1'; -- A é maior que B
    else
      igual <= '0'; -- A não é igual a B
      menor <= '1'; -- A é menor que B
      maior <= '0'; -- A não é maior que B
    end if;
  end process;

end architecture;