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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transferFunction is
    Port ( inp : in std_logic_vector (7 downto 0);
            clk : in std_logic;
           outp : out std_logic_vector (7 downto 0));
end transferFunction;

architecture Behavioral of transferFunction is

signal y1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal y2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal y3 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

signal u1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal u2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal u3 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

signal temp : std_logic_vector(63 downto 0);

--type reg_array is array(0 to 2) of signed(22 downto 0);
--signal y : reg_array :=(
--""
--);

attribute mark_debug : string;

attribute mark_debug of clk : signal is "true";

attribute mark_debug of y1 : signal is "true";
attribute mark_debug of y2 : signal is "true";
attribute mark_debug of y3 : signal is "true";
attribute mark_debug of temp : signal is "true";

attribute mark_debug of u1 : signal is "true";
attribute mark_debug of u2 : signal is "true";
attribute mark_debug of u3 : signal is "true";

begin
    process(clk)
    begin
        if(rising_edge(clk))
        then
            y1<=y2;
            y2<=y3;
            y3<="00000000000000000000000000000000";
            
            u1<=u2;
            u2<=u3;
            u3<="000000000000000000000000" & inp;
            
            --temp <= (0*u3 + 1*u2 + 0*u1 + 24*y2 - 9*y1 );
            temp <= u2 + std_logic_vector(24*unsigned(y2)) -  std_logic_vector(9*unsigned(y1))  ;
            y3 <= temp(31 downto 0);
            --y3 <= shift_right(y3, 4);
            
            --temp <= y3 * 4;
            --y3 <= temp(31 downto 0);
            
            outp <= std_logic_vector(y3(9 downto 2));
        end if;
    end process;
    
    

end Behavioral;
