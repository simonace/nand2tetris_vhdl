library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port(
    a: in std_logic;
    b: in std_logic;
    sel: in std_logic;
    o: out std_logic);
  
end mux;

architecture behav of mux is
  signal asel: std_logic;
  signal bsel: std_logic;
  signal notsel: std_logic;
  
begin
  notsel <= not sel;
  asel <= a and notsel;
  bsel <= b and sel;
  o <= asel or bsel;
end behav;
