library ieee;
use ieee.std_logic_1164.all;

entity ram8 is
  port(
    i: in std_logic_vector(15 downto 0);
    load: in std_logic;
    clk: in std_logic;
    addr: in std_logic_vector(2 downto 0);
    o: out std_logic_vector(15 downto 0));
end ram8;

architecture behav of ram8 is
  component reg16
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
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
  
  component mux8way16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      c: in std_logic_vector(15 downto 0);
      d: in std_logic_vector(15 downto 0);
      e: in std_logic_vector(15 downto 0);
      f: in std_logic_vector(15 downto 0);
      g: in std_logic_vector(15 downto 0);
      h: in std_logic_vector(15 downto 0);
      sel: in std_logic_vector(2 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal r1: std_logic;
  signal r2: std_logic;
  signal r3: std_logic;
  signal r4: std_logic;
  signal r5: std_logic;
  signal r6: std_logic;
  signal r7: std_logic;
  signal r8: std_logic;
  
  signal r1out: std_logic_vector(15 downto 0);
  signal r2out: std_logic_vector(15 downto 0);
  signal r3out: std_logic_vector(15 downto 0);
  signal r4out: std_logic_vector(15 downto 0);
  signal r5out: std_logic_vector(15 downto 0);
  signal r6out: std_logic_vector(15 downto 0);
  signal r7out: std_logic_vector(15 downto 0);
  signal r8out: std_logic_vector(15 downto 0);
  
begin
  dm:dmux8way port map(load, addr, r1, r2, r3, r4, r5, r6, r7, r8);
  reg1:reg16 port map(i, r1, clk, r1out);
  reg2:reg16 port map(i, r2, clk, r2out);
  reg3:reg16 port map(i, r3, clk, r3out);
  reg4:reg16 port map(i, r4, clk, r4out);
  reg5:reg16 port map(i, r5, clk, r5out);
  reg6:reg16 port map(i, r6, clk, r6out);
  reg7:reg16 port map(i, r7, clk, r7out);
  reg8:reg16 port map(i, r8, clk, r8out);
  m:mux8way16 port map(r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, addr, o);
  
end behav;
