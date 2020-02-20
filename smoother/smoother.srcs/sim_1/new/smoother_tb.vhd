----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2020 03:15:18 PM
-- Design Name: 
-- Module Name: smoother_tb - Behavioral
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

entity smoother_tb is
--  Port ( );
end smoother_tb;

architecture Behavioral of smoother_tb is
    signal tb_in    : STD_LOGIC_VECTOR(7 downto 0):=X"FF";
    signal tb_clk   : STD_LOGIC:='0';
    signal tb_out   : STD_LOGIC_VECTOR(7 downto 0);
    signal tb_latch    : STD_LOGIC:='0';
    signal tb_enable    : STD_LOGIC:='0';
    signal tb_reset:   STD_LOGIC;
    constant period   : time := 5 ns;

component smoother is
    Port ( clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           latch : in STD_LOGIC;
           reset: in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

begin

    DUT: smoother port map (reset=> tb_reset, clock=>tb_clk, input=>tb_in, output=>tb_out, enable=>tb_enable, latch=>tb_latch);
    
    generate_clock : process(tb_clk)
        begin
            tb_clk <= not tb_clk after period/2;
        end process;
        
    main: process
    
        begin
        tb_reset <= '0';
        tb_latch <= '0';
        wait for 10ns;
        tb_reset <= '1';
        tb_enable <= '1';
        wait for 20ns;
        tb_reset <= '0';
        tb_in <= "10000000";
        wait for 10ns;
        tb_latch <= '1';
        wait for 10ns;
        tb_latch <= '0';
        wait for 30ns;
        wait for 2000ns;
        wait for 2000ns;
        end process;


end Behavioral;

