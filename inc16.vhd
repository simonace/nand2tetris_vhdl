library ieee;
use ieee.std_logic_1164.all;

entity inc16 is
  port(
    i: in std_logic_vector(15 downto 0);
    o: out std_logic_vector(15 downto 0));
end entity;

architecture behav of inc16 is
  component adder16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
begin
  a16:adder16 port map(i, x"0001", o);
    
end behav;