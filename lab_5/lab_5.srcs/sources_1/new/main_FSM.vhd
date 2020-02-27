----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 05:45:56 PM
-- Design Name: 
-- Module Name: main_FSM - Behavioral
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

entity main_FSM is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           color : out STD_LOGIC;
           direction : in STD_LOGIC);
end main_FSM;

architecture Behavioral of main_FSM is
    type Color_Type         is (Red, Green, Blue, White, Black, Yellow, Purple);
    type Color_State_Type   is (Red, Green, Blue, Alarm, Standby, Yellow, Purple);
    
    signal Color_Drive      : Color_Type; 

    variable Color_State      : Color_State_Type; 

    begin

    main_state_machine: process
    variable tickcounter: integer range 0 to 15;
    begin
    if reset='1' then
        Color_State     := Standby;
        Color_Drive     <= White;
        tickcounter     := 0;
    
    elsif clock'event and clock='1' then      -- on timer clock edge do color change.
        case Color_State is
            WHEN Red =>
                Color_Drive<=Red;
                if direction='1' then
                    Color_State<= Yellow;
                else
                    Color_State<= Yellow;
                end if;
                
            WHEN Green =>
                Color_Drive<=Green;   
                if direction='1' then
                Color_State<= Blue;
            else
                Color_State<= Yellow;
            end if;
            
            WHEN Blue => 
                Color_Drive<=Blue;
                if direction='1' then
                Color_State<= Purple;
            else
                Color_State<= Green;
            end if;
            
            WHEN Alarm => 
                Color_Drive<=White;
                tickcounter:=tickcounter+1;
                if tickcounter = 7 then
                    tickcounter:= 0;
                    Color_State<= Standby;
                end if;
                        
            WHEN Standby =>
                Color_Drive<=White;
                tickcounter:=tickcounter+1;
                if tickcounter = 4 then
                    tickcounter:= 0;
                    if direction='1' then
                        Color_State<= Red;
                    else
                        Color_State<= Purple;
                    end if;
                end if;
            
            WHEN Yellow => 
                Color_Drive<=Yellow;
                if direction='1' then
                Color_State<= Green;
            else
                Color_State<= Red;
            end if;
            
            
            WHEN Purple => 
                Color_Drive<=Purple;
                if direction='1' then
                Color_State<= Red;
            else
                Color_State<= Blue;
            end if;
            
            WHEN others =>      -- just in case
                Color_Drive <= White; 
                Color_State <= Standby;
                tickcounter:= 2;

        end case;
    end if;
    wait on clock, reset;
    end process;



end Behavioral;
