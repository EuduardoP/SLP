-------------------------------------------------------------------------------
-- Title      : Porta XOR com duas entradas
-- Project    : Aulas de VHDL
-------------------------------------------------------------------------------
-- File       : porta_xor2.vhd
-- Author     : Giovani Baratto (gfbaratto)  <Giovani.Baratto@ufsm.br>
-- Company    : UFSM - CT - DELC
-- Created    : 2019-08-05
-- Last update: 2020-04-20
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-08-05  1.0      gfbaratto       Created
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
entity porta_xor2a is
  port(x : in  std_logic;               -- uma das entradas da porta xor
       y : in  std_logic;               -- a outra entrada da porta xor
       z : out std_logic);              -- saída da porta xor
end entity porta_xor2a;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
architecture simples of porta_xor2a is
begin

  process(x, y)
    variable xy : std_logic_vector(1 downto 0);
  begin
    xy := x&y;
    case xy is
      when "00"   => z <= '0';
      when "01"   => z <= '1';
      when "10"   => z <= '1';
      when "11"   => z <= '0';
      when others => z <= 'X';
    end case;
  end process;

end architecture simples;
-------------------------------------------------------------------------------

