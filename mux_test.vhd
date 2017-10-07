-- testbench for mux

library ieee;
use ieee.std_logic_1164.all;

entity mux_test is
end mux_test;

architecture behav of mux_test is
  component mux
    port(
      a: in std_logic;
      b: in std_logic;
      sel: in std_logic;
      o: out std_logic);
  end component;
  
  signal aa: std_logic := '0';
  signal bb: std_logic := '0';
  signal ss: std_logic := '0';
  signal oo: std_logic := '0';
  
begin
  dut:mux port map(
    a => aa,
    b => bb,
    sel => ss,
    o => oo);
  
  aa <= '1' after 10 ns;
  bb <= '1' after 30 ns;
  ss <= '1' after 20 ns;
  
end behav;
  
