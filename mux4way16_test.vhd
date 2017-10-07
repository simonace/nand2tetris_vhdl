library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4way16_test is
end entity;

architecture behav of mux4way16_test is
  component mux4way16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      c: in std_logic_vector(15 downto 0);
      d: in std_logic_vector(15 downto 0);
      sel: in std_logic_vector(1 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal aa: std_logic_vector(15 downto 0) := "0000000000000001";
  signal bb: std_logic_vector(15 downto 0) := "0000000000000010";
  signal cc: std_logic_vector(15 downto 0) := "0000000000000100";
  signal dd: std_logic_vector(15 downto 0) := "0000000000001000";
  signal ss: unsigned(1 downto 0) := "00";
  signal oo: std_logic_vector(15 downto 0);
  
begin
  
  process
    begin
      wait for 10 ns;
      ss <= ss + 1;
  end process;
  
  m:mux4way16 port map(aa, bb, cc, dd, std_logic_vector(ss), oo);

end behav;
  