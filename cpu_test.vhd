library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpu_test is
end cpu_test;

architecture behav of cpu_test is
  component cpu is
    port(
      inM: in std_logic_vector(15 downto 0);
      instr: in std_logic_vector(15 downto 0);
      rst: in std_logic;
      clk: in std_logic;
      outM: out std_logic_vector(15 downto 0);
      writeM: out std_logic;
      addrM: out std_logic_vector(15 downto 0);
      pcout: out std_logic_vector(15 downto 0));
  end component;
  
  signal instruction:std_logic_vector(15 downto 0);
  signal reset:std_logic := '0';
  signal clock:std_logic := '0';
  signal inMM:std_logic_vector(15 downto 0);
  signal outMM:std_logic_vector(15 downto 0);
  signal writeMM:std_logic;
  signal addrMM:std_logic_vector(15 downto 0);
  signal pcpc:std_logic_vector(15 downto 0);
  
begin
  process
  begin
    wait for 5 ns;
    clock <= not clock;
  end process;
  
  process
  begin
    wait for 10 ns;
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    wait for 10 ns;
    instruction <= "0011000000111001"; -- @12345
    wait for 10 ns;
    instruction <= "1110110000010000"; -- D=A
    wait for 10 ns;
    instruction <= "0101101110100000"; -- @23456
    wait for 10 ns;
    instruction <= "1110000111010000"; -- D=A-D
    wait for 10 ns;
    instruction <= "0000001111101000"; -- @1000
    wait for 10 ns;
    instruction <= "1110001100001000"; -- M=D
    wait for 10 ns;
    instruction <= "0000001111101001"; -- @1001
    wait for 10 ns;
    instruction <= "1110001110011000"; -- MD=D-1
    wait for 10 ns;
    instruction <= "0000001111101000"; -- @1000
    wait for 10 ns;
    instruction <= "1111010011010000"; -- @D=D-M
    inMM <= "0010101101100111"; -- 11111 decimal
    wait for 10 ns;
    instruction <= "0000000000001110"; -- @14
    wait for 10 ns;
    instruction <= "1110001100000100"; -- D;jlt
    wait for 20 ns;
  end process;
  
  dut:cpu port map(inMM, instruction, reset, clock, outMM, writeMM, addrMM, pcpc);
end behav;
    
  
