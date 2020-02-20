----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2020 07:41:32 AM
-- Design Name: 
-- Module Name: smoother - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity smoother is
    Port ( clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           latch : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end smoother;

architecture Behavioral of smoother is
signal a: STD_LOGIC_VECTOR (7 downto 0);
signal out_value : STD_LOGIC_VECTOR (7 downto 0);

begin
    
    process(latch, reset)
    begin
        if reset='1' then
            a<="00000000";
        elsif rising_edge(latch) then
            a <= input;
       end if;     
    end process;
    
    process(latch,clock)
    variable state:  STD_LOGIC:='0';
    variable count: STD_LOGIC_VECTOR (7 downto 0):="00000000";
    begin
        if enable='1' then
            if rising_edge(latch) then
                count := a;
            end if;
        else
        if rising_edge(latch) then
                count := input;
            end if;
        end if;
                
        if (rising_edge(clock)  and enable='1') then
            if (count > a) then
                count:=count - 1;
            end if;
            if (count < a) then
                count:=count + 1;
            end if;         
        end if;
    output <= count;
    end process;


end Behavioral;
