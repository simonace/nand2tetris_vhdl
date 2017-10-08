library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dmux4way_test is
end entity;

architecture behav of dmux4way_test is
  component dmux4way
    port(
      i: in std_logic;
      sel: in std_logic_vector(1 downto 0);
      a: out std_logic;
      b: out std_logic;
      c: out std_logic;
      d: out std_logic);
  end component;
  
  signal ii:std_logic := '1';
  signal ss:unsigned(1 downto 0) := "00";
  signal aa:std_logic;
  signal bb:std_logic;
  signal cc:std_logic;
  signal dd:std_logic;
  
begin
  dut:dmux4way port map(ii, std_logic_vector(ss), aa, bb, cc, dd);
  
  process
    begin
      wait for 10 ns;
      ss <= ss + 1;
  end process;
  
end behav;
  
  
