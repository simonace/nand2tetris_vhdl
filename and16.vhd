library ieee;
use ieee.std_logic_1164.all;

entity and16 is
  port(
    a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    o: out std_logic_vector(15 downto 0));
end and16;

architecture behav of and16 is
begin
  o <= a and b;
end behav;
