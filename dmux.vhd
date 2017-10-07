-- Demultiplexor:
-- {a, b} = {in, 0} if sel == 0
--          {0, in} if sel == 1

library ieee;
use ieee.std_logic_1164.all;

entity dmux is
  port(
    i: in std_logic;
    sel: in std_logic;
    a: out std_logic;
    b: out std_logic);
  
end dmux;

architecture behav of dmux is
  signal notsel: std_logic;
  
begin
  notsel <= not sel;
  a <= i and notsel;
  b <= i and sel;
  
end behav;
