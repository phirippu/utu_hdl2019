----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2020 05:38:22 PM
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture Behavioral of debounce_tb is

component debounce is 
PORT ( 
   SCLK : in STD_LOGIC;
   INPUT : in STD_LOGIC;
   OUTPUT : out STD_LOGIC
   );
end component;

    signal tb_in    : STD_LOGIC:='0';
    signal tb_clk      : STD_LOGIC:= '0';
    signal tb_out   : STD_LOGIC;
    constant period   : time := 5 ns;

    begin
    
    DUT: debounce port map (SCLK=>tb_clk, INPUT=>tb_in, OUTPUT=>tb_out);
    
    generate_clock : process(tb_clk)
        begin
            tb_clk <= not tb_clk after period/2;
        end process;
        
    main: process
    
        begin
        wait for 200ns;
        tb_in <= '1';
        wait for 10ns;
        tb_in <= '0';
        wait for 20ns;
        tb_in <= '1';
        wait for 30ns;
        tb_in <= '0';
        wait for 10ns;
        tb_in <= '1';
        wait for 2000ns;
        tb_in <= '0';
        wait for 10ns;
        tb_in <= '1';
        wait for 10ns;
        tb_in <= '0';
        wait for 20ns;
        tb_in <= '1';
        wait for 30ns;
        tb_in <= '0';
        wait for 2000ns;
        end process;
        
end Behavioral;
