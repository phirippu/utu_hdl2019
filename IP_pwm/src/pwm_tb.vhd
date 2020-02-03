----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2020 10:19:05 PM
-- Design Name: 
-- Module Name: pwm_tb - Behavioral
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

entity pwm_tb is
--  Port ( );
end pwm_tb;

architecture Behavioral of pwm_tb is

signal tb_duty  : STD_LOGIC_VECTOR (7 downto 0):=X"00";
signal tb_clk   : STD_LOGIC:='0';
signal tb_out   : STD_LOGIC;
constant period : time := 1 ns;


begin
DUT: entity work.pwm
    port map (pwclk=>tb_clk, pwduty=>tb_duty, pwout=>tb_out);

    generate_clock : process(tb_clk)
        begin
            tb_clk <= not tb_clk after period/2;
        end process;
    
    main: process
    
        begin
        wait for 200ns;
        tb_duty <= X"20";
        wait for 1000ns;
        tb_duty <= X"30";
        wait for 1000ns;
        tb_duty <= X"50";
        wait for 1000ns;
        tb_duty <= X"01";
        wait for 1000ns;
        tb_duty <= X"FF";
        wait for 1000ns;
        tb_duty <= X"FE";
        wait for 1000ns;
        tb_duty <= X"00";
        wait for 1000ns;
        tb_duty <= X"02";
        wait for 1000ns;
        end process;
end Behavioral;
