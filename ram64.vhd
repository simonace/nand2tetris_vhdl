library ieee;
use ieee.std_logic_1164.all;

entity ram64 is
  port(
    i: in std_logic_vector(15 downto 0);
    load: in std_logic;
    clk: in std_logic;
    addr: in std_logic_vector(5 downto 0);
    o: out std_logic_vector(15 downto 0));
end ram64;

architecture behav of ram64 is
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
  
  component ram8
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      clk: in std_logic;
      addr: in std_logic_vector(2 downto 0);
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
  dm:dmux8way port map(load, addr(5 downto 3), r1, r2, r3, r4, r5, r6, r7, r8);
  rm1:ram8 port map(i, r1, clk, addr(2 downto 0), r1out);
  rm2:ram8 port map(i, r2, clk, addr(2 downto 0), r2out);
  rm3:ram8 port map(i, r3, clk, addr(2 downto 0), r3out);
  rm4:ram8 port map(i, r4, clk, addr(2 downto 0), r4out);
  rm5:ram8 port map(i, r5, clk, addr(2 downto 0), r5out);
  rm6:ram8 port map(i, r6, clk, addr(2 downto 0), r6out);
  rm7:ram8 port map(i, r7, clk, addr(2 downto 0), r7out);
  rm8:ram8 port map(i, r8, clk, addr(2 downto 0), r8out);
  m:mux8way16 port map(r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, addr(5 downto 3), o);
  
end behav;