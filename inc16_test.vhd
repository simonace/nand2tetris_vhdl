library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inc16_test is
end entity;

architecture behav of inc16_test is
  component inc16
    port(
      i: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal ii:unsigned(15 downto 0) := x"FFFF";
  signal oo:std_logic_vector(15 downto 0) := (others => '0');
  
begin
  dut:inc16 port map(std_logic_vector(ii), oo);
    
  process
    begin
      wait for 5 ns;
      ii <= ii + 5;
  end process;
  
end behav;
