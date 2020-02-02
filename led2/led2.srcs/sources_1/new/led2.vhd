----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2020 03:09:08 PM
-- Design Name: 
-- Module Name: led2 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led2 is
    Port ( led : out STD_LOGIC_VECTOR (7 downto 0);
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           GCLK: in STD_LOGIC
           );
end led2;

architecture Behavioral of led2 is
signal clk100 : STD_LOGIC;
begin
--    led <= sw;
process(GCLK)
    variable cnt : STD_LOGIC_VECTOR (23 downto 0);
    begin
        if  rising_edge(GCLK) then
            cnt := cnt + 1;
            if cnt = X"1312D0" then
                cnt := X"000000";
                clk100 <='1';
            else
                clk100 <='0';
            end if;
        end if;
    end process;

process (clk100)
    variable led_b: STD_LOGIC_VECTOR (7 downto 0);
    variable div_b: STD_LOGIC_VECTOR (7 downto 0);
    variable cnt_b: STD_LOGIC_VECTOR (7 downto 0);
    begin
    if rising_edge(clk100) then
        div_b := SW + 1;
        cnt_b := cnt_b + 1;
        if cnt_b = div_b then
            led_b := led_b + 1;
            led <= led_b;
            cnt_b := "00000000";
        end if;
    end if;
    end process;

end Behavioral;
