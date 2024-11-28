-------------------------------------------------------------------------------
-- Title      : Porta XOR com duas entradas
-- Project    : Aulas de VHDL
-------------------------------------------------------------------------------
-- File       : porta_xor2c.vhd
-- Author     : Giovani Baratto (gfbaratto)  <Giovani.Baratto@ufsm.br>
-- Company    : UFSM - CT - DELC
-- Created    : 2019-08-05
-- Last update: 2020-04-21
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
entity porta_xor2c is
  port(x : in  std_logic;               -- uma das entradas da porta xor
       y : in  std_logic;               -- a outra entrada da porta xor
       z : out std_logic);              -- saída da porta xor
end entity porta_xor2c;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
architecture simples of porta_xor2c is
begin
  z <= (x and (not y))or((not x) and y); -- função de chaveamento
end architecture simples;
-------------------------------------------------------------------------------
