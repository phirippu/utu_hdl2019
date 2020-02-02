----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2020 08:27:10 AM
-- Design Name: 
-- Module Name: single_bit_multiplier - Behavioral
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

entity single_bit_multiplier is
Port ( 
    clk, x, y, s_in, c_in : in std_ulogic;
    s_out, c_out : out std_ulogic
    );
end single_bit_multiplier;

architecture Behavioral of single_bit_multiplier is

begin
    s_out <= (x AND y) xor c_in xor s_in when rising_edge(clk);
    c_out <= ((x AND y) AND s_in) OR ((x AND y) AND c_in) OR (s_in AND c_in) when rising_edge(clk);
    
end Behavioral;