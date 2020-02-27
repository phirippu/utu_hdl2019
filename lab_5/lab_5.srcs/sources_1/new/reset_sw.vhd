----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 05:45:56 PM
-- Design Name: 
-- Module Name: reset_sw - Behavioral
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

entity reset_sw is
    Port (  btn_in : in STD_LOGIC;
            clock : in STD_LOGIC;
            reset_out : out STD_LOGIC   );
end reset_sw;

architecture Behavioral of reset_sw is

begin
    process(clock)
    begin
    if (rising_edge(clock) and btn_in = '1') then
        reset_out <= '1';       -- If the reset button is pressed, hold the reset line for one input clock.
    else
        reset_out <= '0';       
    end if;
    end process;
end Behavioral;
