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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is

component clk_div_4bit is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           divisr : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC);
end component;

constant period   : time := 50 ns;

signal tb_clk   : STD_LOGIC:='0';
signal tb_reset:   STD_LOGIC;
signal tb_out:   STD_LOGIC;
signal tb_div   : STD_LOGIC_VECTOR(3 downto 0);

begin

    DUT: clk_div_4bit port map (reset=> tb_reset, divisr=>tb_div, clock => tb_clk, output => tb_out );

    generate_clock : process(tb_clk)
            begin
                tb_clk <= not tb_clk after period/2;
            end process;
            
main:   process
                
        begin
        tb_reset <= '0';
        tb_div <= "0000";
        wait for 10ns;
        tb_reset <= '1';
        wait for 20ns;
        tb_reset <= '0';
        tb_div <= "0001";
        wait for 2000ns;
        tb_div <= "0010";
        wait for 1000ns;
        tb_div <= "0000";
        wait for 2000ns;
        tb_div <= "0111";
        wait for 3000ns;
       
        wait for 2000ns;
        end process;
end Behavioral;
