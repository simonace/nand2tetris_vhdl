library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dmux8way_test is
end entity;

architecture behav of dmux8way_test is
  component dmux8way
    port(
      i: in std_logic;
      sel: in std_logic_vector(2 downto 0);
      a: out std_logic;
      b: out std_logic;
      c: out std_logic;
      d: out std_logic;
      e: out std_logic;
      f: out std_logic;
      g: out std_logic;
      h: out std_logic);
  end component;
  
  signal ii:std_logic := '1';
  signal ss:unsigned(2 downto 0) := "000";
  signal aa:std_logic;
  signal bb:std_logic;
  signal cc:std_logic;
  signal dd:std_logic;
  signal ee:std_logic;
  signal ff:std_logic;
  signal gg:std_logic;
  signal hh:std_logic;
  
begin
  dut:dmux8way port map(ii, std_logic_vector(ss), aa, bb, cc, dd, ee, ff, gg, hh);
  
  process
    begin
      wait for 10 ns;
      ss <= ss + 1;
  end process;
  
end behav;