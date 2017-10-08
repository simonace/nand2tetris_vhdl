library ieee;
use ieee.std_logic_1164.all;

entity halfAdder is
  port(
    a: in std_logic;
    b: in std_logic;
    sum: out std_logic;
    carry: out std_logic);
end entity;

architecture behav of halfAdder is
begin
  sum <= a xor b;
  carry <= a and b;
end behav;
