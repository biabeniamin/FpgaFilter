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

signal y1 : signed(31 downto 0);
signal y2 : signed(31 downto 0);
signal y3 : signed(31 downto 0);

signal u1 : signed(31 downto 0);
signal u2 : signed(31 downto 0);
signal u3 : signed(31 downto 0);

signal temp : signed(63 downto 0);

--type reg_array is array(0 to 2) of signed(22 downto 0);
--signal y : reg_array :=(
--""
--);

attribute mark_debug : string;

attribute mark_debug of clk : signal is "true";

attribute mark_debug of y1 : signal is "true";
attribute mark_debug of y2 : signal is "true";
attribute mark_debug of y3 : signal is "true";

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
            u3<=signed("000000000000000000000000" & inp);
            
            temp <= (1375*u3 + 2751*u2 + 1375*u1 + 96605*y2 - 36570*y1 );
            y3 <= temp(31 downto 0);
            y3 <= shift_right(y3, 16);
            
            outp <= std_logic_vector(y3(7 downto 0));
        end if;
    end process;

end Behavioral;
