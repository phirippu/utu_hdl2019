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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.all;

entity top_lab5 is
    Port ( 
            sw : in STD_LOGIC_VECTOR (3 downto 0);
--           btn : in STD_LOGIC_VECTOR (3 downto 0);
--           led5 : out STD_LOGIC_VECTOR (2 downto 0);
--           led6 : out STD_LOGIC_VECTOR (2 downto 0);
           jc   : out STD_LOGIC_VECTOR (7 downto 0);
           sysclk:  in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end top_lab5;

architecture Behavioral of top_lab5 is
    signal lowclock: std_logic;
    signal slowclock: std_logic;
    signal pwm0duty: std_logic_vector (7 downto 0);

    component clk_div 
        generic (scale:integer);
        port ( clk : in STD_LOGIC;
                   clkout : out STD_LOGIC);
    end component;
    
    component pwm8
        Port ( pwm : in STD_LOGIC_VECTOR (7 downto 0);
               clock : in STD_LOGIC;
               pwmout : out STD_LOGIC);
    end component;
    
begin

DIV0: clk_div generic map (scale=>1023) port map (clk => sysclk, clkout=>lowclock);
DIV1: clk_div generic map (scale=>255) port map (clk => lowclock, clkout=>slowclock);
PWM0: pwm8 port map (clock => sysclk, pwm => pwm0duty, pwmout => led(3));

jc <= "00000000";

process(lowclock)
variable state: std_logic:='1';
variable pwcnt : integer range 0 to 255;
begin
    if rising_edge(slowclock) then
        if state = '1' then
            pwcnt := pwcnt + 1;
        else
            pwcnt := pwcnt - 1;
        end if;
        if pwcnt=0 or pwcnt=255 then
            state := not state;
        end if;
    end if;
    
    led(0) <= state;
    led(1) <= not state;
    led(2) <= '0';
    pwm0duty <= std_logic_vector(to_unsigned(pwcnt,8));
end process;

end Behavioral;
