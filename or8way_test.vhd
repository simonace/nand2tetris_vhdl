library ieee;
use ieee.std_logic_1164.all;

entity or8way_test is
end entity;

architecture behav of or8way_test is
  component or8way
    port(
      i: in std_logic_vector(7 downto 0);
      o: out std_logic);
  end component;
  
  signal ii: std_logic_vector(7 downto 0) := (others => '1');
  signal oo: std_logic;
  
begin
  
  dut:or8way port map(i => ii, o => oo);
  
  process
    begin
      wait for 10 ns;
      ii <= "00000001";
      wait for 10 ns;
      ii <= "00000000";
      wait for 10 ns;
      ii <= "10000000";
      wait;
  end process;
  
end behav;
