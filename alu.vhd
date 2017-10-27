-- The ALU (Arithmetic Logic Unit).
-- Computes one of the following functions:
-- x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
-- x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
-- according to 6 input bits denoted zx,nx,zy,ny,f,no.
-- In addition, the ALU computes two 1-bit outputs:
-- if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
-- if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.

-- Implementation: the ALU logic manipulates the x and y inputs
-- and operates on the resulting values, as follows:
-- if (zx == 1) set x = 0        // 16-bit constant
-- if (nx == 1) set x = !x       // bitwise not
-- if (zy == 1) set y = 0        // 16-bit constant
-- if (ny == 1) set y = !y       // bitwise not
-- if (f == 1)  set out = x + y  // integer 2's complement addition
-- if (f == 0)  set out = x & y  // bitwise and
-- if (no == 1) set out = !out   // bitwise not
-- if (out == 0) set zr = 1
-- if (out < 0) set ng = 1

library ieee;
use ieee.std_logic_1164.all;

entity alu is
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
end alu;

architecture behav of alu is
  component mux16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      sel: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component not16
    port(
      i: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component adder16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component or8way
    port(
      i: in std_logic_vector(7 downto 0);
      o: out std_logic);
  end component;
  
  component and16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal xzx0: std_logic_vector(15 downto 0);
  signal yzy0: std_logic_vector(15 downto 0);
  signal notx: std_logic_vector(15 downto 0);
  signal noty: std_logic_vector(15 downto 0);
  signal xnotx: std_logic_vector(15 downto 0);
  signal ynoty: std_logic_vector(15 downto 0);
  signal xandy: std_logic_vector(15 downto 0);
  signal xplusy: std_logic_vector(15 downto 0);
  signal xfy: std_logic_vector(15 downto 0);
  signal notxfy: std_logic_vector(15 downto 0);
  signal oo: std_logic_vector(15 downto 0);
  signal or1: std_logic;
  signal or2: std_logic;
  
begin
  -- constant0 x y
  m1:mux16 port map(x, X"0000", zx, xzx0);
  m2:mux16 port map(y, X"0000", zy, yzy0);
  -- bitwise-not x y
  not1:not16 port map(xzx0, notx);
  not2:not16 port map(yzy0, noty);
  m3:mux16 port map(xzx0, notx, nx, xnotx);
  m4:mux16 port map(yzy0, noty, ny, ynoty);
  -- bitwise-and x y
  and1:and16 port map(xnotx, ynoty, xandy);
  -- add x y
  add1:adder16 port map(xnotx, ynoty, xplusy);
  -- choose which f: & +
  m5:mux16 port map(xandy, xplusy, f, xfy);
  -- bitwise-not fout
  not3:not16 port map(xfy, notxfy);
  -- if negate out
  m6:mux16 port map(xfy, notxfy, no, oo);
  -- if out is zero
  highor:or8way port map(oo(15 downto 8), or1);
  lowor:or8way port map(oo(7 downto 0), or2);
  zr <= or1 nor or2;
  ng <= oo(15);
  o <= oo;
  
end behav;
  
  
    
