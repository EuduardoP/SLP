-------------------------------------------------------------------------------
-- Title      : Testbench de uma porta XOR com duas entradas
-- Project    : Aulas de VHDL
-------------------------------------------------------------------------------
-- File       : porta_xor2.vhd
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
use ieee.std_logic_1164.all;            -- necessário para o tipo std_logic
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
entity porta_xor2c_tb is                -- entidade vazia
end entity porta_xor2c_tb;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
architecture simples of porta_xor2c_tb is
  -- declaração do componente
  component porta_xor2c is
    port (
      x : in  std_logic;                -- entradas da porta xor
      y : in  std_logic;                --
      z : out std_logic);               -- saídas da porta xor
  end component porta_xor2c;

  -- declaração dos sinais 
  signal x : std_logic;  -- sinal ligado a entrada x do componente
  signal y : std_logic;  -- sinal ligado a entrada x do componente
  signal z : std_logic;                 -- sinal ligado a saída z do componente
begin

  -- instanciação do componente porta_xor2
  DUT : porta_xor2c
    port map (                          -- mapeamos as entradas do componente
      x => x,
      y => y,
      z => z);

  -- testes do componente
  testes : process
  begin
    x <= '0';        -- fazemos inicialmente as duas saídas iguais a 0
    y <= '0';
    wait for 10 ns;                     -- esperamos um intervalo de tempo


    x <= '0';                           -- fazemos uma das entradas igual a 1
    y <= '1';
    wait for 10 ns;                     -- esperamos um intervalo de tempo


    x <= '1';                           -- fazemos a outra entrada igual a 1
    y <= '0';
    wait for 10 ns;                     -- esperamos um intervalo de tempo

    x <= '1';                           -- todas as entradas iguais a 1
    y <= '1';
    wait for 10 ns;                     -- esperamos um intervalo de tempo
    wait;                               -- não saímos desta linha
  end process testes;

end architecture simples;
-------------------------------------------------------------------------------

