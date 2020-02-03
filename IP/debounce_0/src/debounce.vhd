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
    Port ( SCLK : in STD_LOGIC;
           INPUT : in STD_LOGIC;
           OUTPUT : out STD_LOGIC);
end entity debounce;

architecture Behavioral of debounce is
begin
    process(SCLK)
    variable tout: integer range 0 to clk_cycles := 0;
    variable lock: std_logic;
    begin
        if (rising_edge(SCLK)) then
            if (INPUT='1') then
                if lock='0' then tout := tout + 1; end if;
                if tout=clk_cycles then
                    lock := '1';
                    OUTPUT<='1';
                    tout:=0;
                else
                    OUTPUT<='0';
                end if;
            else
                lock:='0';
                OUTPUT<='0';
            end if; 
        end if;   
        end process;
    
end Behavioral;
