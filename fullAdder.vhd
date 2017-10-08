library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
  port(
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    sum: out std_logic;
    carry: out std_logic);
end entity;

architecture behav of fullAdder is
  component halfAdder
      port(
      a: in std_logic;
      b: in std_logic;
      sum: out std_logic;
      carry: out std_logic);
  end component;
  
  signal hasum:std_logic;
  signal hacarry:std_logic;
  signal csum:std_logic;
  
begin
  ha:halfAdder port map(a, b, hasum, hacarry);
  sum <= hasum xor c;
  csum <= hasum and c;
  carry <= csum or hacarry;
end behav;
