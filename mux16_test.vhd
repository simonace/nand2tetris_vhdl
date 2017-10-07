library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16_test is
end mux16_test;

architecture behav of mux16_test is
  signal aa: unsigned(15 downto 0) := (others => '0');
  signal bb: unsigned(15 downto 0) := (others => '1');
  signal ss: std_logic := '0';
  signal oo: std_logic_vector(15 downto 0);
  
  component mux16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      sel: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
begin
  process
    begin
      aa <= aa + 1;
      bb <= bb - 1;
      wait for 10 ns;
  end process;
  
  process
    begin
      ss <= not ss;
      wait for 55 ns;
  end process;
  
  dut:mux16 port map(std_logic_vector(aa), std_logic_vector(bb), ss, oo);
  
end behav;
      
