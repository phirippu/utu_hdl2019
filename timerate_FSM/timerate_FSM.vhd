----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 05:45:56 PM
-- Design Name: 
-- Module Name: timerate_FSM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timerate_FSM is
    Port ( btn_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           rate : out STD_LOGIC_VECTOR (3 downto 0));
end timerate_FSM;

architecture Behavioral of timerate_FSM is

begin
main_state_machine: process
    variable state: integer range 0 to 15;
    begin
    if reset='1' then
        state     := 1;
   
    elsif rising_edge(btn_in) then      
        case state is
            WHEN 1 =>
            state := 3;
                
            WHEN 3 =>
            state := 5;

            WHEN 5 =>
            state := 1;

            WHEN others =>
            state := 1;
    end case;
    end if;
    rate <= std_logic_vector(to_unsigned(state,4));
    wait on btn_in, reset;
    end process;
    
end Behavioral;
