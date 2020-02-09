----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2020 09:06:19 PM
-- Design Name: 
-- Module Name: top_lab5 - Behavioral
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
use work.all;

entity top_lab5 is
    Port ( 
--            sw : in STD_LOGIC_VECTOR (3 downto 0);
--           btn : in STD_LOGIC_VECTOR (3 downto 0);
--           led5 : out STD_LOGIC_VECTOR (2 downto 0);
--           led6 : out STD_LOGIC_VECTOR (2 downto 0);
           jc   : out STD_LOGIC_VECTOR (7 downto 0);
           sysclk:  in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end top_lab5;

architecture Behavioral of top_lab5 is
    signal lowclock: std_logic;

    component clk_div 
        generic (scale:integer);
        port ( clk : in STD_LOGIC;
                   clkout : out STD_LOGIC);
    end component;
    
begin

DIV0: clk_div generic map (scale=>65536) port map (clk => sysclk, clkout=>lowclock);

jc <= "00000000";

process(lowclock)
variable state: std_logic:='0';
begin
    if rising_edge(lowclock) then
        state := not state;
    end if;
    led(0) <= state;
    led(1) <= state;
    led(2) <= not state;
    led(3) <= not state;
end process;

end Behavioral;
