----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 05:45:56 PM
-- Design Name: 
-- Module Name: color_coder - Behavioral
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


library work;
use work.types.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_coder is
    Port ( color : in Color_Type;
           out_R : out STD_LOGIC_VECTOR (7 downto 0);
           out_G : out STD_LOGIC_VECTOR (7 downto 0);
           out_B : out STD_LOGIC_VECTOR (7 downto 0));
end color_coder;

architecture Behavioral of color_coder is
begin
color_switch: process(color)         --  Process that is sensitive to color state. Each change of the Color_Drive signal is reflected on the RGB outputs.
    begin
        case color is
        WHEN Red =>
            out_R<="11111111";       
            out_G<="00000000";
            out_B<="00000000";
        WHEN Green =>
            out_R<="00000000";       
            out_G<="11111111";
            out_B<="00000000";
        
        WHEN Blue =>
            out_R<="00000000";       
            out_G<="00000000";
            out_B<="11111111";
        
        WHEN White =>
            out_R<="11111111";       
            out_G<="11111111";
            out_B<="11111111";
        
        WHEN Black =>
            out_R<="00000000";       
            out_G<="00000000";
            out_B<="00000000";
        
        WHEN Yellow =>
            out_R<="11111111";       
            out_G<="11111111";
            out_B<="00000000";
        
        WHEN Purple =>
            out_R<="10000000";       
            out_G<="00000000";
            out_B<="10000000";
        
        WHEN others =>          -- debug. This should never happen but if it happens, it will be visible.
            out_R<="00000100";       
            out_G<="00001000";
            out_B<="00010000";
        end case;
    end process;
end Behavioral;
