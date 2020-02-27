----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2020 05:01:14 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
    generic(clk_cycles:integer:=127);
    Port ( clock : in STD_LOGIC;
           input : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC);
end entity debounce;

architecture Behavioral of debounce is
begin
    process(clock,reset)
    variable tout: integer range 0 to clk_cycles;
    variable lock: std_logic;
    variable state: std_logic;
    begin
    if reset='1' then
        lock := '0';
        tout := 0;
    elsif (rising_edge(clock)) then
        if (input='1') then
            if lock='0' then tout := tout + 1; end if;
            if tout=clk_cycles then
                lock := '1';
                state:='1';
                tout:=0;
            else
                state:='0';
            end if;
        else
            lock:='0';
            state:='0';
        end if; 
    end if;   
    output<=state;
    end process;
end Behavioral;
