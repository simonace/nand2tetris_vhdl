library ieee;
use ieee.std_logic_1164.all;

entity adder16 is
  port(
    a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    o: out std_logic_vector(15 downto 0));
end entity;

architecture behav of adder16 is
  component fullAdder
      port(
      a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      sum: out std_logic;
      carry: out std_logic);
  end component;
  
  component halfAdder
      port(
      a: in std_logic;
      b: in std_logic;
      sum: out std_logic;
      carry: out std_logic);
  end component;
  
  signal c1:std_logic;
  signal c2:std_logic;
  signal c3:std_logic;
  signal c4:std_logic;
  signal c5:std_logic;
  signal c6:std_logic;
  signal c7:std_logic;
  signal c8:std_logic;
  signal c9:std_logic;
  signal c10:std_logic;
  signal c11:std_logic;
  signal c12:std_logic;
  signal c13:std_logic;
  signal c14:std_logic;
  signal c15:std_logic;
  signal c16:std_logic;
  
begin
  ha:halfAdder port map(a => a(0), b => b(0), sum => o(0), carry => c1);
  
  fa1:fullAdder port map(a => a(1), b => b(1), c => c1, sum => o(1), carry => c2);

  fa2:fullAdder port map(a => a(2), b => b(2), c => c2, sum => o(2), carry => c3);

  fa3:fullAdder port map(a => a(3), b => b(3), c => c3, sum => o(3), carry => c4);

  fa4:fullAdder port map(a => a(4), b => b(4), c => c4, sum => o(4), carry => c5);

  fa5:fullAdder port map(a => a(5), b => b(5), c => c5, sum => o(5), carry => c6);

  fa6:fullAdder port map(a => a(6), b => b(6), c => c6, sum => o(6), carry => c7);

  fa7:fullAdder port map(a => a(7), b => b(7), c => c7, sum => o(7), carry => c8);

  fa8:fullAdder port map(a => a(8), b => b(8), c => c8, sum => o(8), carry => c9);

  fa9:fullAdder port map(a => a(9), b => b(9), c => c9, sum => o(9), carry => c10);

  fa10:fullAdder port map(a => a(10), b => b(10), c => c10, sum => o(10), carry=> c11);

  fa11:fullAdder port map(a => a(11), b => b(11), c => c11, sum => o(11), carry=> c12);

  fa12:fullAdder port map(a => a(12), b => b(12), c => c12, sum => o(12), carry=> c13);

  fa13:fullAdder port map(a => a(13), b => b(13), c => c13, sum => o(13), carry=> c14);

  fa14:fullAdder port map(a => a(14), b => b(14), c => c14, sum => o(14), carry=> c15);

  fa15:fullAdder port map(a => a(15), b => b(15), c => c15, sum => o(15), carry=> c16);
  
end behav;


  
