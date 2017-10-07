-- 8-way 16-bit multiplexor:
-- out = a if sel == 000
--       b if sel == 001
--       etc.
--       h if sel == 111

library ieee;
use ieee.std_logic_1164.all;

entity mux8way16 is
  port(
    a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    c: in std_logic_vector(15 downto 0);
    d: in std_logic_vector(15 downto 0);
    e: in std_logic_vector(15 downto 0);
    f: in std_logic_vector(15 downto 0);
    g: in std_logic_vector(15 downto 0);
    h: in std_logic_vector(15 downto 0);
    sel: in std_logic_vector(2 downto 0);
    o: out std_logic_vector(15 downto 0));
end entity;

architecture behav of mux8way16 is
  component mux4way16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      c: in std_logic_vector(15 downto 0);
      d: in std_logic_vector(15 downto 0);
      sel: in std_logic_vector(1 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component mux16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      sel: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal abcd:std_logic_vector(15 downto 0);
  signal efgh:std_logic_vector(15 downto 0);
  
begin
  
  m1:mux4way16 port map(a, b, c, d, sel(1 downto 0), abcd);
  m2:mux4way16 port map(e, f, g, h, sel(1 downto 0), efgh);
  m3:mux16 port map(abcd, efgh, sel(2), o);

end behav;