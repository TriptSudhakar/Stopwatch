----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2022 02:16:54 PM
-- Design Name: 
-- Module Name: time_to_16 - Behavioral
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

entity time_to_16 is
  Port ( m: in integer;
    s1: in integer;
    s0: in integer;
    t: in integer;
    v_final : out std_logic_vector(15 downto 0));
end time_to_16;

architecture Behavioral of time_to_16 is
signal m_bit : std_logic_vector(3 downto 0);
signal s1_bit : std_logic_vector(3 downto 0);
signal s0_bit : std_logic_vector(3 downto 0);
signal t_bit : std_logic_vector(3 downto 0);

component dec_to_bin is 
Port ( no : in integer;
  bin :out std_logic_vector(3 downto 0));
end component;

begin
UUT1: dec_to_bin port map(no=>m, bin=>m_bit);
UUT2: dec_to_bin port map(no=>s1, bin=>s1_bit);
UUT3: dec_to_bin port map(no=>s0, bin=>s0_bit);
UUT4: dec_to_bin port map(no=>t, bin=>t_bit);
v_final(3 downto 0) <= t_bit;
v_final(7 downto 4) <= s0_bit;
v_final(11 downto 8) <= s1_bit;
v_final(15 downto 12) <= m_bit;
end Behavioral;
