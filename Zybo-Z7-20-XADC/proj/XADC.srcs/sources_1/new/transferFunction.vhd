----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2018 08:09:52 PM
-- Design Name: 
-- Module Name: transferFunction - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transferFunction is
    Port ( inp : in STD_LOGIC_VECTOR (7 downto 0);
            clk : in std_logic;
           outp : out STD_LOGIC_VECTOR (7 downto 0));
end transferFunction;

architecture Behavioral of transferFunction is

signal y : signed(22 downto 0);
--type reg_array is array(0 to 2) of signed(22 downto 0);
--signal y : reg_array :=(
--""
--);

begin
    process(clk)
    begin
        if(rising_edge(clk))
        then
            outp <= inp;
        end if;
    end process;

end Behavioral;
