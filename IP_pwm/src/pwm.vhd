----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2020 08:44:08 PM
-- Design Name: 
-- Module Name: pwm - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is
    Port ( pwclk : in STD_LOGIC;
           pwduty : in STD_LOGIC_VECTOR (7 downto 0);
           pwout : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is
begin
    process(pwclk)
        variable pwm_cnt: STD_LOGIC_VECTOR (7 downto 0):="00000000";
       -- variable pwm_duty:  STD_LOGIC_VECTOR (7 downto 0):="00000000";
        begin
            if rising_edge(pwclk) then
               -- pwm_duty:= pwduty;
                if pwm_cnt=pwduty+1 then
                    pwout <= '0';
                end if;
                if pwm_cnt="00000000" then 
                    pwout <= '1';
                end if;
                if pwduty="00000000" then 
                    pwout <= '0';
                end if;
                pwm_cnt:=pwm_cnt+1;
            end if;
    end process;
    
end Behavioral;
