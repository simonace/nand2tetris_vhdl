-- 8-way demultiplexor:
-- {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
--                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
--                            etc.
--                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111

library ieee;
use ieee.std_logic_1164.all;

entity dmux8way is
  port(
    i: in std_logic;
    sel: in std_logic_vector(2 downto 0);
    a: out std_logic;
    b: out std_logic;
    c: out std_logic;
    d: out std_logic;
    e: out std_logic;
    f: out std_logic;
    g: out std_logic;
    h: out std_logic);
end entity;

architecture behav of dmux8way is
  component dmux4way
    port(
      i: in std_logic;
      sel: in std_logic_vector(1 downto 0);
      a: out std_logic;
      b: out std_logic;
      c: out std_logic;
      d: out std_logic);
  end component;
  
  component dmux
    port(
      i: in std_logic;
      sel: in std_logic;
      a: out std_logic;
      b: out std_logic);
  end component;
  
  signal abcd:std_logic;
  signal efgh:std_logic;

begin
  
  dm1:dmux port map(i, sel(2), abcd, efgh);
  dm2:dmux4way port map(abcd, sel(1 downto 0), a, b, c, d);
  dm3:dmux4way port map(efgh, sel(1 downto 0), e, f, g, h);
  
end behav;
