----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2020 09:19:26 PM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clk_div is
    generic( scale:integer:=2047 );
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           clkout : out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is
begin
    process(clock, reset)
        variable cnt:integer range 0 to scale;       -- Divide input frequency by 2*scale. Scale must be non-zero, positive.
        variable state: std_logic;
        begin
        if reset='1' then
            state := '0';
            cnt := 0;
        elsif rising_edge(clock) then
            cnt:=cnt+1;
            if cnt=scale then 
                state:=state xor '1';
                cnt:=0;
            end if;
        end if;
    clkout<=state;
    end process;
end Behavioral;
