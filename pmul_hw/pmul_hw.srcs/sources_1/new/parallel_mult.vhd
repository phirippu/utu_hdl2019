library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parallel_multiplayer is
generic(n :natural := 4);
Port ( 
       clk : in std_ulogic;
       x : in std_ulogic_vector(n - 1 downto 0); -- X
       y : in std_ulogic_vector(n - 1 downto 0); -- Y
       s : out std_ulogic_vector(2*n - 1 downto 0) -- X * Y
);
end parallel_multiplayer;

architecture Behavioral of parallel_multiplayer is
    type signalArray is 
        array(Natural range<>, Natural range<>)
        of std_ulogic;
		
    component single_bit_multiplier is
    Port ( 
        clk, x, y, s_in, c_in : in std_ulogic;
        s_out, c_out : out std_ulogic
        );
    end component;

    signal carry : signalArray(n-1 downto 0, n-1 downto 0) := ((others=> (others=>'0')));
    signal sum: signalArray(n-1 downto 0, n-1 downto 0) := ((others=> (others=>'0')));
   
begin

GEN_I: for i in 0 to n-1 generate
begin
GEN_J: for j in i to n-1 generate
     IF_1: if i = 0 and j = 0 generate -- corner
         IJ_0: single_bit_multiplier
         port map(
             clk, x(j), y(i), '0','0', s(i), carry(i,j)
         );
     end generate;
     IF_2: if i = 0 and j > 0 generate -- row
         IJ_1: single_bit_multiplier 
         port map(
             clk, x(j), y(i), '0', carry(i,j-1), sum(i,j), carry(i,j)
         ); 
     end generate;
     IF_3: if i > 0 and j = i generate -- last diagonal
         IJ_2: single_bit_multiplier 
         port map(
             clk, x(0), y(i), sum(i-1, j), '0', s(i), carry(i,j)
         );          
     end generate;
     IF_4: if i > 0 and i /= j  generate -- middle elements
         IJ_3: single_bit_multiplier 
         port map(
             clk, x(j-i), y(i), sum(i-1, j), carry(i,j-1), sum(i,j), carry(i,j)
         );                         
     end generate;
   end generate;
end generate;
   


end Behavioral;