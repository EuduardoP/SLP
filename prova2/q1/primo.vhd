--  1. (5,0 pontos, 40 min.) Seja um circuito combinacional com 1 entrada x[3..0] com 4 bits, uma entrada enable e 
--  uma saída y. O sinal nas entradas x[3..0] representam um número binário sem sinal com 4 bits, com o valor de 0 
--  a 15. A saída y é igual a 1 quando o número x[3..0] é um número primo1 e o sinal habilita está ativo. A saída 
--  y permanece em 0 quando enable está inativo. Faça um testbench, verificando que o circuito reconhece os 
--  números primos e que o sinal enable está funcionado corretamente. Salve a tela com a simulação2

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity primo is
    port (
        x   : in std_logic_vector (3 downto 0);
        y   : out std_logic
    );
end entity;

architecture simple of primo is
    signal m1, m2, m3, m4 : std_logic;
begin
    m1 <= (not x(3) and not x(2) and x(0));
    m2 <= (not x(3) and     x(2) and x(0));
    m3 <= (    x(2) and not x(1) and x(0));
    m4 <= (not x(2) and     x(1) and x(0));
    
    y <= m1 or m2 or m3 or m4;

end architecture;