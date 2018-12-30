----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2018 10:30:47 PM
-- Design Name: 
-- Module Name: test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;




entity test is
    Port ( u : in STD_LOGIC_VECTOR (7 downto 0));
end test;

architecture Behavioral of test is

signal clk : std_logic;


signal inp : std_logic_vector (7 downto 0);

signal outp : std_logic_vector (7 downto 0);

component transferFunction
Port ( inp : in std_logic_vector (7 downto 0);
            clk : in std_logic;
           outp : out std_logic_vector (7 downto 0));
end component;


begin
uu : transferFunction port map(clk => clk, inp => inp, outp => outp);

process
begin
    inp <="11111111";
    clk <= '1';
       wait for 1 ms;
       clk <= '0';
       wait for 1 ms;
       clk <= '1';
           wait for 1 ms;
           clk <= '0';
           wait for 1 ms;
            clk <= '1';
              wait for 1 ms;
              clk <= '0';
              wait for 1 ms;
              clk <= '1';
                  wait for 1 ms;
                  clk <= '0';
                  wait for 1 ms;
end process;

end Behavioral;
