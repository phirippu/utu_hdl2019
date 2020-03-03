----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 05:45:56 PM
-- Design Name: 
-- Module Name: alarm_FSM - Behavioral
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

entity alarm_FSM is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           color : out Color_Type);
end alarm_FSM;

architecture Behavioral of alarm_FSM is

begin
alarm_state_machine: process
    variable Color_State  : Color_State_Type; 
    variable Color_Drive  : Color_Type;
    
    begin
    if reset='1' then
        Color_State     := Standby;
        Color_Drive     := White;
    
    elsif rising_edge(clock) then      -- on timer clock edge do color change.
        case Color_State is
            WHEN Alarm =>
                Color_Drive:=White;
                Color_State:=Off;
              
            WHEN Off =>
                Color_Drive:=Black;
                Color_State:=Alarm;

            WHEN others =>      -- just in case
                Color_Drive:=White;
                Color_State:=Off;
        end case;
    end if;
    wait on clock, reset;
    color <= Color_Drive;
    end process;


end Behavioral;
