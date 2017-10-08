library ieee;
use ieee.std_logic_1164.all;

entity fullAdder_test is
end entity;

architecture behav of fullAdder_test is
  component fullAdder
      port(
      a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      sum: out std_logic;
      carry: out std_logic);
  end component;
  
  signal aa:std_logic := '0';
  signal bb:std_logic := '0';
  signal cc:std_logic := '0';
  signal ss:std_logic := '0';
  signal ca:std_logic := '0';
  
begin
  process
    begin
      wait for 10 ns;
      aa <= not aa;
  end process;
  
  process
    begin
      wait for 20 ns;
      bb <= not bb;
  end process;
  
  process
    begin
      wait for 40 ns;
      cc <= not cc;
  end process;
  
  fa:fullAdder port map(aa, bb, cc, ss, ca);
end behav;
