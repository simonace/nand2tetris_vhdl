-- 8-way Or: 
-- out = (in[0] or in[1] or ... or in[7])

library ieee;
use ieee.std_logic_1164.all;

entity or8way is
  port(
    i: in std_logic_vector(7 downto 0);
    o: out std_logic);
end entity;

architecture behav of or8way is
  signal or1: std_logic;
  signal or2: std_logic;
  signal or3: std_logic;
  signal or4: std_logic;
  signal or5: std_logic;
  signal or6: std_logic;

begin
  or1 <= i(0) or i(1);
  or2 <= or1 or i(2);
  or3 <= or2 or i(3);
  or4 <= or3 or i(4);
  or5 <= or4 or i(5);
  or6 <= or5 or i(6);
  o <= or6 or i(7);
  
end behav;
  
    
