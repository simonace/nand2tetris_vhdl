library ieee;
use ieee.std_logic_1164.all;

entity cpu is
  port(
    inM: in std_logic_vector(15 downto 0);
    instr: in std_logic_vector(15 downto 0);
    rst: in std_logic;
    clk: in std_logic;
    outM: out std_logic_vector(15 downto 0);
    writeM: out std_logic;
    addrM: out std_logic_vector(15 downto 0);
    pcout: out std_logic_vector(15 downto 0));
end cpu;

architecture behav of cpu is
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
  
  component mux16
    port(
      a: in std_logic_vector(15 downto 0);
      b: in std_logic_vector(15 downto 0);
      sel: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component pc
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      inc: in std_logic;
      reset: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  component reg16
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal outMM:std_logic_vector(15 downto 0);
  signal cAorOut:std_logic;
  signal oAorOut:std_logic_vector(15 downto 0);
  signal loadRegA:std_logic;
  signal oRegA:std_logic_vector(15 downto 0);
  signal cAorM:std_logic;
  signal oAorM:std_logic_vector(15 downto 0);
  signal loadPC:std_logic;
  signal incPC:std_logic;
  signal oPC:std_logic_vector(15 downto 0);
  signal zzrr:std_logic;
  signal nngg:std_logic;
  signal loadRegD:std_logic;
  signal oRegD:std_logic_vector(15 downto 0);
  
  
begin
  cAorOut <= not instr(15);
  mAorOut:mux16 port map(outMM, instr, cAorOut, oAorOut);
  loadRegA <= (not instr(15)) or instr(5);
  regA:reg16 port map(oAorOut, loadRegA, clk, oRegA);
  cAorM <= instr(12);
  mAorM:mux16 port map(oRegA, inM, cAorM, oAorM);
  addrM <= oRegA;
  loadPC <= instr(15) and ((instr(2) and nngg) or (instr(1) and zzrr) or (instr(0) and (not nngg)));
  incPC <= not loadPC;
  pcpc:pc port map(oRegA, loadPC, incPC, rst, clk, oPC);
  loadRegD <= instr(4) and instr(15);
  regD:reg16 port map(outMM, loadRegD, clk, oRegD);
  alualu:alu port map(oRegD, oAorM, instr(11), instr(10), instr(9), instr(8), instr(7), instr(6), outMM, zzrr, nngg);
  outM <= outMM;
  writeM <= instr(3) and instr(15);
  pcout <= oPC;

end behav;
