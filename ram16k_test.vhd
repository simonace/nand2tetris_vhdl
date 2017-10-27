library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram16k_test is
end ram16k_test;

architecture behav of ram16k_test is
  component ram16k
    port(
      i: in std_logic_vector(15 downto 0);
      load: in std_logic;
      clk: in std_logic;
      addr: in std_logic_vector(13 downto 0);
      o: out std_logic_vector(15 downto 0));
  end component;
  
  signal address: std_logic_vector(13 downto 0) := (others => '0');
  signal di: std_logic_vector(15 downto 0) := (others => '0');
  signal ll: std_logic := '1';
  signal cc: std_logic :='0';
  signal oo: std_logic_vector(15 downto 0);
  
begin
  process
  begin
    wait for 5 ns;
    cc <= not cc;
  end process;
  
  process
  begin
    --write
    wait for 3 ns;
    ll <= '1';
    di <= X"0000";
    wait for 10 ns;
    di <= X"000F";
    wait for 10 ns;
    di <= X"00F0";
    wait for 10 ns;
    di <= X"0F00";
    wait for 10 ns;
    di <= X"3FFF";
    wait for 10 ns;
    di <= X"0345";
    wait for 10 ns;
    di <= X"3ABC";
    wait for 10 ns;
    di <= X"09F1";
    --read
    wait for 10 ns;
    ll <= '0';
    di <= X"0000";
    wait for 10 ns;
    di <= X"000F";
    wait for 10 ns;
    di <= X"00F0";
    wait for 10 ns;
    di <= X"0F00";
    wait for 10 ns;
    di <= X"3FFF";
    wait for 10 ns;
    di <= X"0345";
    wait for 10 ns;
    di <= X"3ABC";
    wait for 10 ns;
    di <= X"09F1";
    wait;  
  end process;
  
  address <= di(13 downto 0);
  
  dut:ram16k port map(di, ll, cc, std_logic_vector(address), oo);

end behav;