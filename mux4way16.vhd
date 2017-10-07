-- 4-way 16-bit multiplexor:
-- out = a if sel == 00
--       b if sel == 01
--       c if sel == 10
--       d if sel == 11

library ieee;
use ieee.std_logic_1164.all;

entity mux4way16 is
  port(
    a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    c: in std_logic_vector(15 downto 0);
    d: in std_logic_vector(15 downto 0);
    sel: in std_logic_vector(1 downto 0);
    o: out std_logic_vector(15 downto 0));
end entity;

architecture behav of mux4way16 is
  component mux16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      sel: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal ab: std_logic_vector(15 downto 0);
  signal cd: std_logic_vector(15 downto 0);
  
begin
  m1:mux16 port map(a, b, sel(0), ab);
  m2:mux16 port map(c, d, sel(0), cd);
  m3:mux16 port map(ab, cd, sel(1), o);
  
end behav;
