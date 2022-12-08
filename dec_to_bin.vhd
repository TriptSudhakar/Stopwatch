----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2022 12:40:10 PM
-- Design Name: 
-- Module Name: dec_to_bin - Behavioral
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

entity dec_to_bin is
  Port ( no : in integer;
  bin :out std_logic_vector(3 downto 0));
end dec_to_bin;

architecture Behavioral of dec_to_bin is

begin
bin(0) <= '1' when no mod 2 = 1 else '0';
bin(1) <= '1' when (no/2) mod 2 = 1 else '0' ;
bin(2) <= '1' when (no/4) mod 2 = 1 else '0' ;
bin(3) <= '1' when (no/8) mod 2 = 1 else '0' ;
end Behavioral;
