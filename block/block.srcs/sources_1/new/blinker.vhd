----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2020 11:18:23 PM
-- Design Name: 
-- Module Name: blinker - Behavioral
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

entity blinker is
     Port ( led : out STD_LOGIC_VECTOR (3 downto 0);
            btn_up: in STD_LOGIC;
            btn_dn: in STD_LOGIC;
            GCLK: in STD_LOGIC
       );

end blinker;

architecture Behavioral of blinker is

begin


end Behavioral;
