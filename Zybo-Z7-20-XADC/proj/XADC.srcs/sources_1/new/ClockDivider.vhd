----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2018 02:36:13 PM
-- Design Name: 
-- Module Name: ClockDivider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockDivider is
    Port ( dClk : in STD_LOGIC;

           dClkD : out STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is

signal counter : std_logic_vector(31 downto 0);
signal masked : std_logic_vector(31 downto 0);

begin

    process(dClk)
    begin
    
        if(rising_edge(dClk)) then
            counter <= counter + 1;
        end if;
    
    end process;
--masked <= (counter and mask);

dClkD <= counter(13);


end Behavioral;
