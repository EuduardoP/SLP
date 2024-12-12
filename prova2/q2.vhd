library ieee;
use ieee.std_logic_1164.all; -- usamos std_logic e std_logic_vector

-- contador LFSR de 3 bits com um circuito para incluir o estado 000
entity q2 is
  port
  (
    x   : out std_logic_vector(2 downto 0); -- saídas do contador
    clk : in std_logic;                     -- sinal de relógio
    rst : in std_logic                      -- sinal de reset assincrono
  );
end entity;

architecture q2 of q2 is
  signal Q  : std_logic_vector(x'range); -- estado do registrador de deslocamento
  signal x3 : std_logic;                 -- resultado da função linear
begin

  x3 <= (Q(2) nor Q(1)) xor (Q(1) xor Q(0)); -- função linear do contador e reconhecimento do estado 000
  x  <= Q;                                   -- atualizamos a saída

  process (clk, rst)
  begin
    if rst = '1' then           -- se reset é ativo
      Q <= (others => '0');       -- os flip-flops do registrador são zerados
    elsif rising_edge(clk) then -- senão, na borda de subida do relógio
      Q <= x3 & Q(2 downto 1);    -- realizamos o deslocamento para a direita
    end if;
  end process;

end architecture;