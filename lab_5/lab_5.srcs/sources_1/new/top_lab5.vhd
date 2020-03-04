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
library work;
use work.types.all;

entity top_lab5 is
    Port ( 
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           led5 : out STD_LOGIC_VECTOR (2 downto 0);
--           led6 : out STD_LOGIC_VECTOR (2 downto 0);
--           jc   : out STD_LOGIC_VECTOR (7 downto 0);
           sysclk:  in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end top_lab5;

architecture Behavioral of top_lab5 is
    signal clock100KHz: std_logic;
    signal clockPRGDIV: std_logic;
    signal clock10Hz: std_logic;
    signal clockSmooth: std_logic;
    signal clockSmoothNEG: std_logic;
    signal clockAlarm: std_logic;
    signal clockColor: std_logic;
    
    signal clockAlarmNEG: std_logic;
    signal clockColorNEG: std_logic;
    signal smoothLatch:   std_logic;
    signal smoothEnable:   std_logic;
    
    signal master_reset: std_logic;
    signal alarm_active: std_logic;
    
    signal color_R_duty: std_logic_vector (7 downto 0);
    signal color_G_duty: std_logic_vector (7 downto 0);
    signal color_B_duty: std_logic_vector (7 downto 0);

    signal pwm_R_duty: std_logic_vector (7 downto 0);
    signal pwm_G_duty: std_logic_vector (7 downto 0);
    signal pwm_B_duty: std_logic_vector (7 downto 0);

    signal reset_button: std_logic;
    signal rate_button: std_logic;
    signal direction_button: std_logic;
    signal alarm_button: std_logic;
    signal smooth_button: std_logic;
    
    signal color_output: Color_Type;
    signal color_alarm: Color_Type;
    signal color_normal: Color_Type;
    
    signal direction_state: std_logic;
    
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
    
    component reset_sw is
        Port (  btn_in : in STD_LOGIC;
                clock : in STD_LOGIC;
                reset_out : out STD_LOGIC   );
    end component;
    
    component smoother is
        Port ( clock : in STD_LOGIC;
               enable : in STD_LOGIC;
               reset : in STD_LOGIC;
               latch : in STD_LOGIC;
               input : in STD_LOGIC_VECTOR (7 downto 0);
               output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component color_coder is
        Port ( color : in Color_Type;
               out_R : out STD_LOGIC_VECTOR (7 downto 0);
               out_G : out STD_LOGIC_VECTOR (7 downto 0);
               out_B : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component main_FSM is
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               color : out Color_Type;
               direction : in STD_LOGIC);
    end component;
    
    component timerate_FSM is
        Port ( btn_in : in STD_LOGIC;
               reset : in STD_LOGIC;
               rate : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component alarm_FSM is
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               color : out Color_Type);
    end component;
          
    component  alarm_timeout is
        generic( scale:integer);
        Port ( clock : in STD_LOGIC;
               alarm : in STD_LOGIC;
               output : out STD_LOGIC;
               reset : in STD_LOGIC);
    end  component;   
    
begin

DIV_4BIT_PROG:clk_div_4bit port map (divisr=> time_pace, clock =>           sysclk,       output=>clockPRGDIV, reset=>master_reset); -- divide master clock by 2, 6, or 10

DIV_DEBOUNCE_PWM:   clk_div generic map (scale=>625) port map (clock =>     sysclk,       clkout=>clock100KHz,    reset=>master_reset); -- make 100 kHz for debouncers and PWM
DIV_ALARM_TIMEOUT:  clk_div generic map (scale=>5000) port map (clock =>    clock100KHz,  clkout=>clock10Hz,      reset=>master_reset); -- make 10Hz for alarm timeout

DIV_SMOOTH:         clk_div generic map (scale=>31250) port map (clock =>   clockPRGDIV,  clkout=>clockSmooth,    reset=>master_reset); -- make 1000, 333 or 200 Hz for smooth and further division

DIV_ALARM:          clk_div generic map (scale=>50) port map (clock =>      clockSmooth,  clkout=>clockAlarm,     reset=>master_reset); -- 10, 3.3 or 2 Hz for the Alarm FSM
DIV_COLOR:          clk_div generic map (scale=>5) port map (clock =>       clockAlarm,   clkout=>clockColor,     reset=>master_reset); -- 1, 0.33, or 0.2 Hz for the main color FSM

clockSmoothNEG <= not clockSmooth; -- create a delayed clock base for color latches

DIV_ALARM_NEG:          clk_div generic map (scale=>50) port map (clock =>      clockSmoothNEG,  clkout=>clockAlarmNEG,     reset=>master_reset); -- 10, 3.3 or 2 Hz shifted by 0.5 ms
DIV_COLOR_NEG:          clk_div generic map (scale=>5) port map (clock =>       clockAlarmNEG,   clkout=>clockColorNEG,     reset=>master_reset); -- 1, 0.33, or 0.2 Hz shifted by 0.5 ms 

PWMR: pwm8 port map (clock => clock100KHz, pwm => pwm_R_duty, pwmout => led5(0), reset=>master_reset); -- RGB PWM blocks. 100 kHz is used to save power.
PWMG: pwm8 port map (clock => clock100KHz, pwm => pwm_G_duty, pwmout => led5(1), reset=>master_reset);
PWMB: pwm8 port map (clock => clock100KHz, pwm => pwm_B_duty, pwmout => led5(2), reset=>master_reset);

-- jc <= "00000000"; -- debug outputs

DEB_ALARM:      debounce generic map (clk_cycles=>255) port map (clock =>   clock100KHz, input => btn(0), output => alarm_button ,    reset=>master_reset); -- four buttons to control the device
DEB_DIRECTION:  debounce generic map (clk_cycles=>255) port map (clock =>   clock100KHz, input => btn(1), output => direction_button, reset=>master_reset);
DEB_PACESWITCH: debounce generic map (clk_cycles=>255) port map (clock =>   clock100KHz, input => btn(2), output => rate_button ,     reset=>master_reset);
DEB_RESET:      debounce generic map (clk_cycles=>255) port map (clock =>   clock100KHz, input => btn(3), output => reset_button ,    reset=>'0');

smoothEnable <= (not alarm_active) and sw(0); -- smoothers are disabled during alarm, or if sw(0) is zero.
smoothLatch <= clockColorNEG when (alarm_active='0') else clockAlarmNEG; -- smoothers are latched 0.5 ms after the color changes

led(0) <= alarm_active; 
led(1) <= clockColor;
led(2) <= clockAlarm;
led(3) <= clockSmooth;

SMOOTHR:        smoother port map(clock=> clockSmooth,     enable => smoothEnable,     reset =>master_reset,     latch =>  smoothLatch,   input => color_R_duty,    output=> pwm_R_duty);
SMOOTHG:        smoother port map(clock=> clockSmooth,     enable => smoothEnable,     reset =>master_reset,     latch =>  smoothLatch,   input => color_G_duty,    output=> pwm_G_duty);
SMOOTHB:        smoother port map(clock=> clockSmooth,     enable => smoothEnable,     reset =>master_reset,     latch =>  smoothLatch,   input => color_B_duty,    output=> pwm_B_duty);

color_output <= color_alarm when (alarm_active = '1') else color_normal; -- color MUX between alarm and normal FSM

COLORCODER: color_coder port map(color => color_output,  out_R => color_R_duty, out_G => color_G_duty, out_B => color_B_duty);

process (direction_button)  -- make button toggle states of the direction (may also use a switch for that?)
variable state: std_logic:='0';
begin
    if rising_edge(direction_button) then
        state := not state;
    end if;
    direction_state <= state;
end process;

MAIN_COLOR_FSM:    main_FSM port map (clock =>  clockColor,  reset=>master_reset, direction => direction_state, color => color_normal);
ALARM_COLOR_FSM:   alarm_FSM port map (clock => clockAlarm,  reset=>master_reset, color => color_alarm);

TIME_RATE_FSM: timerate_FSM port map (btn_in => rate_button,  reset=>master_reset, rate => time_pace);

ALARM_TOUT_FSM: alarm_timeout generic map (scale=>50) port map (clock =>clock10Hz,  reset=>master_reset, alarm=> alarm_button, output=>alarm_active);

RESET_GEN:  reset_sw port map(btn_in => reset_button, clock => sysclk, reset_out => master_reset);

end Behavioral;
