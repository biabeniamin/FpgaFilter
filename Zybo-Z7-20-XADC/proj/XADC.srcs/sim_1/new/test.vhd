library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity transferFunction_tb is
end;

architecture bench of transferFunction_tb is

  component transferFunction
      Port ( inp : in std_logic_vector (7 downto 0);
              clk : in std_logic;
             outp : out std_logic_vector (7 downto 0)
            );
  end component;

  signal inp: std_logic_vector (7 downto 0);
  signal clk: std_logic;
  signal outp: std_logic_vector (7 downto 0);


  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: transferFunction port map ( inp  => inp,
                                   clk  => clk,
                                   outp => outp );

  stimulus: process
  begin
  
    -- Put initialisation code here
    inp <= "00011111";

    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
