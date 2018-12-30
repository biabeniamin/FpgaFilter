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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transferFunction is
    Port ( inp : in STD_LOGIC_VECTOR (7 downto 0);
           outp : out STD_LOGIC_VECTOR (7 downto 0));
end transferFunction;

architecture Behavioral of transferFunction is

begin

    outp <= inp;

end Behavioral;
