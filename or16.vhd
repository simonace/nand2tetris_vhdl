library ieee;
use ieee.std_logic_1164.all;

entity or16 is
  port(
    a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    o: out std_logic_vector(15 downto 0));
end or16;

architecture behav of or16 is
begin
  o <= a or b;
end behav;

