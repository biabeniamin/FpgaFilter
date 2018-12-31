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

library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
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


signal temp : std_logic_vector(63 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000";



attribute mark_debug : string;

attribute mark_debug of clk : signal is "true";



begin
    process(clk)
    variable var : integer;
    variable y1 : integer := 0;
    variable y2 : integer := 0;
    variable y3 : integer := 0;
    
    variable u1 : integer := 0;
    variable u2 : integer := 0;
    variable u3 : integer := 0;

    begin
        if(rising_edge(clk))
        then
            y1:=y2;
                    y2:=y3;
                    y3:=0;
                    
                                
                                            
                                            
           u1:=u2;
           u2:=u3;
           u3:=to_integer(unsigned(inp));
            
            --temp <= (0*u3 + 1*u2 + 0*u1 + 24*y2 - 9*y1 );
            --temp <= std_logic_vector(unsigned(u2)*2);-- + std_logic_vector(24*unsigned(y2)) -  std_logic_vector(9*unsigned(y1))  ;
            var := (5*u3+11*u2+5*u1);
            var := var + 377 * y2-143*y1;
            var := var /256;
            y3 := var;  

            --y3 <= y3 / 4;
            --y3 <= shift_right(y3, 4);
            
            --temp <= y3 * 4;
            --y3 <= temp(31 downto 0);
            
            outp <= std_logic_vector(to_unsigned(y3, 8));
            
        end if;
    end process;
    
    

end Behavioral;
