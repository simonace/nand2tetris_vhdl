library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_test is
end alu_test;

architecture behav of alu_test is
  component alu
    port(
      x: in std_logic_vector(15 downto 0);
      y: in std_logic_vector(15 downto 0);
      zx: in std_logic;
      nx: in std_logic;
      zy: in std_logic;
      ny: in std_logic;
      f: in std_logic;
      no: in std_logic;
      o: out std_logic_vector(15 downto 0);
      zr: out std_logic;
      ng: out std_logic);
  end component;
  
  signal xx:std_logic_vector(15 downto 0) := X"0011";
  signal yy:std_logic_vector(15 downto 0) := X"0003";
  signal zzxx: std_logic;
  signal nnxx: std_logic;
  signal zzyy: std_logic;
  signal nnyy: std_logic;
  signal ffff: std_logic;
  signal nnoo: std_logic;
  signal oo: std_logic_vector(15 downto 0);
  signal zzrr: std_logic;
  signal nngg: std_logic;
  
begin
  dut:alu port map(xx, yy, zzxx, nnxx, zzyy, nnyy, ffff, nnoo, oo, zzrr, nngg);
  
  process
    begin
      wait for 5 ns;
      xx <= X"0011";
      yy <= X"0003";
      zzxx <= '1';
      nnxx <= '0';
      zzyy <= '1';
      nnyy <= '0';
      ffff <= '1';
      nnoo <= '0';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '1';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '1';
      nnyy <= '0';
      ffff <= '1';
      nnoo <= '0';
      wait for 5 ns;
      zzxx <= '0';
      nnxx <= '0';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '0';
      nnoo <= '0';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '0';
      nnyy <= '0';
      ffff <= '0';
      nnoo <= '0';
      wait for 5 ns;
      zzxx <= '0';
      nnxx <= '0';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '0';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '0';
      nnyy <= '0';
      ffff <= '0';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '0';
      nnxx <= '0';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '1';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '0';
      nnyy <= '0';
      ffff <= '1';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '0';
      nnxx <= '1';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '1';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '0';
      nnyy <= '1';
      ffff <= '1';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '0';
      nnxx <= '0';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '1';
      nnoo <= '0';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '0';
      nnyy <= '0';
      ffff <= '1';
      nnoo <= '0';
      -- test for x=x"0000" y=x"1111"
      wait for 5 ns;
      xx <= X"0000";
      yy <= X"1111";
      zzxx <= '1';
      nnxx <= '0';
      zzyy <= '1';
      nnyy <= '0';
      ffff <= '1';
      nnoo <= '0';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '1';
      nnyy <= '1';
      ffff <= '1';
      nnoo <= '1';
      wait for 5 ns;
      zzxx <= '1';
      nnxx <= '1';
      zzyy <= '1';
      nnyy <= '0';
      ffff <= '1';
      nnoo <= '0';
  end process;
  
end behav;
      
      
