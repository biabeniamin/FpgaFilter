----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2018 03:13:57 PM
-- Design Name: 
-- Module Name: dac - Behavioral
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

-- Uncomment the following library declaration if using-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;--use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dac is
    Port ( value : in STD_LOGIC_VECTOR (7 downto 0);
    clk : in std_logic;
    dacBits : out std_logic_vector(7 downto 0));
end dac;

architecture Behavioral of dac is

signal counter : std_logic_vector(7 downto 0);

begin
    process(clk)
    begin
        if(rising_edge(clk))
        then
            counter <= counter + 1;
        end if;
    end process;
    dacBits <= counter;

end Behavioral;
