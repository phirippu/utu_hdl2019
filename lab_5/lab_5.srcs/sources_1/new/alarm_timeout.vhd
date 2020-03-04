----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 05:45:56 PM
-- Design Name: 
-- Module Name: alarm_timeout - Behavioral
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

entity alarm_timeout is
    generic( scale:integer:=10 );
    Port ( clock : in STD_LOGIC;
           alarm : in STD_LOGIC;
           output : out STD_LOGIC;
           reset : in STD_LOGIC);
end alarm_timeout;

architecture Behavioral of alarm_timeout is

begin

process(reset, clock, alarm)
variable cnt:integer range 0 to scale;
variable state: std_logic;
begin
    if reset='1' then
        state := '0';
        cnt:= 0;
    elsif alarm='1' then
        cnt:=scale;
    elsif rising_edge(clock) then
        if (cnt>0) then
            cnt:=cnt-1;
            state:='1';
        else
            state:='0';
        end if;
    end if;
output <= state;    
end process;


end Behavioral;
