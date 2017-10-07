-- testbench for mux

library ieee;
use ieee.std_logic_1164.all;

entity dmux_test is
end dmux_test;

architecture behav of dmux_test is
  component dmux 
    port(
      i: in std_logic;
      sel: in std_logic;
      a: out std_logic;
      b: out std_logic);
  end component;
  
  signal ii: std_logic :='0';
  signal ss: std_logic :='0';
  signal aa: std_logic :='0';
  signal bb: std_logic :='0';
  
begin
  dut:dmux port map(
    i => ii,
    sel => ss,
    a => aa,
    b => bb);
  
  process
    begin
      ii <= not ii;
      wait for 10 ns;
  end process;
  
  ss <= '1' after 25 ns;
  
end behav;
  