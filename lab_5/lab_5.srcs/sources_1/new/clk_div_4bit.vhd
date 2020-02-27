----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 07:32:56 PM
-- Design Name: 
-- Module Name: clk_div_4bit - Behavioral
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

entity clk_div_4bit is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           divisr : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC);
end clk_div_4bit;

architecture Behavioral of clk_div_4bit is

begin
    process(clock, reset)
        variable cnt:integer range 0 to 15;
        variable state: std_logic;
        begin
        if reset='1' then
            state := '0';
        elsif rising_edge(clock) then
            cnt:=cnt+1;
            if cnt=divisr then 
                state:=state xor '1';
                cnt:=0;
            end if;
        end if;
    output<=state;
    end process;
end Behavioral;
