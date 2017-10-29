-- A 16-bit counter with load and reset control bits.
-- if      (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
-- else                    out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;


entity pc is
  port(
    i: in std_logic_vector(15 downto 0);
    load: in std_logic;
    inc: in std_logic;
    reset: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(15 downto 0));
end pc;

architecture behav of pc is
  component inc16
    port(
      i: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
begin
  process(clk)
  begin
    if clk'event and clk='1' then
      if reset = '1' then
        oo <= X"0000";
      elsif load = '1' then
        oo <= i;
      elsif inc = '1' then
        oo <= incinc;
      end if;
    end if;
  end process;
  
  iii:inc16 port map(oo, incinc);
  o <= oo;
end behav;

-- I am not using the MUX implementation to fulfill this task rather using the if-else statement in VHDL
-- the MUX implementation of inc16 is as follows: (in the HDL provided in nand2tetris course)
-- CHIP PC {
--     IN in[16],load,inc,reset;
--     OUT out[16];
-- 
--     PARTS:
-- 		Inc16(in = rout, out = add1);
-- 		Mux16(a=rout, b=add1, sel=inc, out=i1);
-- 		Mux16(a=i1, b=in, sel=load, out=i2);
-- 		Mux16(a=i2, b=false, sel=reset, out=mout);
-- 		Register(in=mout, load=true, out=out, out=rout);