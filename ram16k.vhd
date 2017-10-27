library ieee;
use ieee.std_logic_1164.all;

entity ram16k is
  port(
    i: in std_logic_vector(15 downto 0);
    load: in std_logic;
    clk: in std_logic;
    addr: in std_logic_vector(13 downto 0);
    o: out std_logic_vector(15 downto 0));
end ram16k;

architecture behav of ram16k is
  component ram4k
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      clk: in std_logic;
      addr: in std_logic_vector(11 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component mux4way16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      c: in std_logic_vector(15 downto 0);
      d: in std_logic_vector(15 downto 0);
      sel: in std_logic_vector(1 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component dmux4way
    port(
      i: in std_logic;
      sel: in std_logic_vector(1 downto 0);
      a: out std_logic;
      b: out std_logic;
      c: out std_logic;
      d: out std_logic);
  end component;
  
  signal r1: std_logic;
  signal r2: std_logic;
  signal r3: std_logic;
  signal r4: std_logic;
  
  signal r1out: std_logic_vector(15 downto 0);
  signal r2out: std_logic_vector(15 downto 0);
  signal r3out: std_logic_vector(15 downto 0);
  signal r4out: std_logic_vector(15 downto 0);
  
begin
  dm:dmux4way port map(load, addr(13 downto 12), r1, r2, r3, r4);
  rm1:ram4k port map(i, r1, clk, addr(11 downto 0), r1out);
  rm2:ram4k port map(i, r2, clk, addr(11 downto 0), r2out);
  rm3:ram4k port map(i, r3, clk, addr(11 downto 0), r3out);
  rm4:ram4k port map(i, r4, clk, addr(11 downto 0), r4out);
  m:mux4way16 port map(r1out, r2out, r3out, r4out, addr(13 downto 12), o);
  
end behav;