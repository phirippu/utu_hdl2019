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
            btn : in STD_LOGIC_VECTOR (3 downto 0);
            led5 : out STD_LOGIC_VECTOR (2 downto 0);
--           led6 : out STD_LOGIC_VECTOR (2 downto 0);
           jc   : out STD_LOGIC_VECTOR (7 downto 0);
           sysclk:  in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end top_lab5;

architecture Behavioral of top_lab5 is
    signal lowclock: std_logic;
    signal slowclock: std_logic;
    signal master_reset: std_logic;
    signal pwm_R_duty: std_logic_vector (7 downto 0);
    signal pwm_G_duty: std_logic_vector (7 downto 0);
    signal pwm_B_duty: std_logic_vector (7 downto 0);

    signal reset_button: std_logic;
    signal rate_button: std_logic;
    signal direction_button: std_logic;
    signal alarm_button: std_logic;
    signal smooth_button: std_logic;
    
    signal time_pace: std_logic_vector (3 downto 0);

    component clk_div 
        generic (scale:integer);
        Port (   clock : in STD_LOGIC;
                 reset : in STD_LOGIC;
                 clkout : out STD_LOGIC);
    end component;

    component clk_div_4bit 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               divisr : in STD_LOGIC_VECTOR (3 downto 0);
               output : out STD_LOGIC);
    end component;
    
    component pwm8
        Port ( pwm : in STD_LOGIC_VECTOR (7 downto 0);
              clock : in STD_LOGIC;
              reset : in STD_LOGIC;
              pwmout : out STD_LOGIC);
    end component;
    
    component debounce
        generic(clk_cycles:integer);
        Port ( clock : in STD_LOGIC;
               input : in STD_LOGIC;
               reset : in STD_LOGIC;
               output : out STD_LOGIC);
    end component;
    
begin

DIV_DEBOUNCE: clk_div generic map (scale=>1023) port map (clock => sysclk, clkout=>lowclock, reset=>master_reset);
DIV_PWM:      clk_div generic map (scale=>255) port map (clock => lowclock, clkout=>slowclock, reset=>master_reset);
DIV_ALARM:    clk_div generic map (scale=>255) port map (clock => lowclock, clkout=>slowclock, reset=>master_reset);

DIV_ALARM_FSM:clk_div_4bit port map (divisr=> time_pace, clock => lowclock, output=>slowclock, reset=>master_reset);
DIV_COLOR_FSM:clk_div_4bit port map (divisr=> time_pace, clock => lowclock, output=>slowclock, reset=>master_reset);


PWMR: pwm8 port map (clock => sysclk, pwm => pwm_R_duty, pwmout => led5(0), reset=>master_reset);
PWMG: pwm8 port map (clock => sysclk, pwm => pwm_G_duty, pwmout => led5(1), reset=>master_reset);
PWMB: pwm8 port map (clock => sysclk, pwm => pwm_B_duty, pwmout => led5(2), reset=>master_reset);

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
