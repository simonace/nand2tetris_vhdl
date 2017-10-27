-- 16-bit register

library ieee;
use ieee.std_logic_1164.all;

entity reg16 is
  port(
    i: in std_logic_vector(15 downto 0);
    load: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(15 downto 0));
end reg16;

architecture behav of reg16 is
  signal r: std_logic_vector(15 downto 0);
  
begin
  process(clk)
  begin
    if clk'event and clk='1' then
      if load='1' then
        r <= i;
      end if;
    end if;
  end process;
  
  o <= r;
  
end behav;