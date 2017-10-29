library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_test is
end pc_test;

architecture behav of pc_test is
  component pc
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      inc: in std_logic;
      reset: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal ii: std_logic_vector(15 downto 0) := X"ABCD";
  signal ld: std_logic := '0';
  signal rst: std_logic := '0';
  signal incre: std_logic := '0';
  signal clock: std_logic := '0';
  signal oo: std_logic_vector(15 downto 0);
  
begin
  process
  begin
    wait for 5 ns;
    clock <= not clock;
  end process;
  
  process
  begin
    wait for 10 ns;
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait for 60 ns;
    rst <= '1';
    wait for 10 ns;
    rst <= '0';
    wait;
  end process;
  
  process
  begin
    wait for 40 ns;
    incre <= '1';
    wait for 40 ns;
    incre <= '0';
    wait;
  end process;
  
  process
  begin
    wait for 80 ns;
    ld <= '1';
    wait for 10 ns;
    ld <= '0';
    wait;
  end process;
  
  dut:pc port map(ii, ld, incre, rst, clock, oo);
end behav;
    