-- 4-way demultiplexor:
-- {a, b, c, d} = {in, 0, 0, 0} if sel == 00
--                {0, in, 0, 0} if sel == 01
--                {0, 0, in, 0} if sel == 10
--                {0, 0, 0, in} if sel == 11

library ieee;
use ieee.std_logic_1164.all;

entity dmux4way is
  port(
    i: in std_logic;
    sel: in std_logic_vector(1 downto 0);
    a: out std_logic;
    b: out std_logic;
    c: out std_logic;
    d: out std_logic);
end entity;

architecture behav of dmux4way is
  component dmux
    port(
      i: in std_logic;
      sel: in std_logic;
      a: out std_logic;
      b: out std_logic);
  end component;
  
  signal ab:std_logic;
  signal cd:std_logic;
  
begin
  dm1:dmux port map(i, sel(1), ab, cd);
  dm2:dmux port map(ab, sel(0), a, b);
  dm3:dmux port map(cd, sel(0), c, d);
end behav;