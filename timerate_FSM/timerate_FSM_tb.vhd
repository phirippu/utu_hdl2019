----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2020 04:27:58 PM
-- Design Name: 
-- Module Name: timerate_FSM_tb - Behavioral
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

entity timerate_FSM_tb is
--  Port ( );
end timerate_FSM_tb;

architecture Behavioral of timerate_FSM_tb is

component timerate_FSM is
    Port ( btn_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           rate : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal tb_clk   : STD_LOGIC:='0';
signal tb_reset:   STD_LOGIC;
constant period   : time := 50 ns;
signal tb_out   : STD_LOGIC_VECTOR(3 downto 0);
signal tb_btn    : STD_LOGIC:='0';

begin

    DUT: timerate_FSM port map (reset=> tb_reset, btn_in=>tb_btn, rate => tb_out );

    generate_clock : process(tb_clk)
            begin
                tb_clk <= not tb_clk after period/2;
            end process;
            
main:   process
                
        begin
        tb_reset <= '0';
        wait for 10ns;
        tb_reset <= '1';
        wait for 20ns;
        tb_reset <= '0';
        tb_btn <= '1';
        wait for 100ns;
        tb_btn <= '0';
        wait for 100ns;
        tb_btn <= '1';
        wait for 100ns;
        tb_btn <= '0';
        wait for 100ns;
        tb_btn <= '1';
        wait for 100ns;
        tb_btn <= '0';
        wait for 100ns;
        tb_btn <= '1';
        wait for 100ns;
        tb_btn <= '0';
        wait for 100ns;
        tb_btn <= '1';
        wait for 100ns;
        tb_btn <= '0';
        wait for 100ns;
        wait for 2000ns;
        end process;
end Behavioral;
