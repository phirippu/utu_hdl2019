----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2020 03:54:51 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( SWA : in STD_ULOGIC_VECTOR (3 downto 0);
           SWB : in STD_ULOGIC_VECTOR (3 downto 0);
           led : out STD_ULOGIC_VECTOR (7 downto 0);
           GCLK : in STD_ULOGIC);
end top;

architecture Behavioral of top is
  constant n : natural := 4;

 component parallel_multiplayer
  generic(n :natural);
  Port ( 
         clk : in std_ulogic;
         x : in std_ulogic_vector(n - 1 downto 0);
         y : in std_ulogic_vector(n - 1 downto 0);
         s : out std_ulogic_vector(2*n - 1 downto 0)
  );
  end component;


begin

MULT: parallel_multiplayer generic map ( n =>  n)
                               port map ( clk => GCLK,
                                          x => SWA,
                                          y => SWB,
                                          s => led );
end Behavioral;
