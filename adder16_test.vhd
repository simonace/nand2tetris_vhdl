library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder16_test is
end entity;

architecture behav of adder16_test is
  component adder16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal aa:unsigned(15 downto 0) := X"0000";
  signal bb:unsigned(15 downto 0) := X"ffff";
  signal oo:std_logic_vector(15 downto 0);
  
begin
  dut:adder16 port map(std_logic_vector(aa), std_logic_vector(bb), oo);
  
  process
    begin
      wait for 10 ns;
      aa <= aa + 1;
  end process;
  
  process
    begin
      wait for 40 ns;
      bb <= bb - 100;
  end process;
  
end behav;
