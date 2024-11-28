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
entity porta_xor2b is
  port(x : in  std_logic;               -- uma das entradas da porta xor
       y : in  std_logic;               -- a outra entrada da porta xor
       z : out std_logic);              -- saída da porta xor
end entity porta_xor2b;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
architecture simples of porta_xor2b is
  component porta_not is                -- componente porta not
    port (
      x : in  std_logic;
      y : out std_logic);
  end component porta_not;
  component porta_and2 is  -- componente porta and com duas entradas
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic);
  end component porta_and2;
  component porta_or2 is   -- componente porta or com duas entradas
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic);
  end component porta_or2;
  -- sinais para as ligações internas do circuito
  signal s : std_logic_vector(3 downto 0);
begin
  U1 : porta_not                        -- instanciamos uma porta inversora
    port map (
      x => y,
      y => s(0));

  U2 : porta_not                        -- instanciamos outra porta inversora
    port map (
      x => x,
      y => s(1));

  U3 : porta_and2                       -- instanciamos uma porta and
    port map (
      x => x,
      y => s(0),
      z => s(2));

  U4 : porta_and2                       -- instanciamos outra porta and
    port map (
      x => s(1),
      y => y,
      z => s(3));

  U5 : porta_or2                        -- instanciamos uma porta or 
    port map (
      x => s(2),
      y => s(3),
      z => z);

end architecture simples;
-------------------------------------------------------------------------------

