----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10/29/2022 11:58:09 AM
-- Design Name:
-- Module Name: timer_display - Behavioral
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

entity timer_display is
Port ( clk: in std_logic;
sw : in std_logic_vector (3 downto 0);
an : out std_logic_vector(3 downto 0);
seg : out std_logic_vector(6 downto 0);
dp : out std_logic
);
end timer_display;

architecture Behavioral of timer_display is
signal m: integer:=0;
signal s1: integer:=0;
signal s0: integer:=0;
signal t: integer:=0;
signal v: std_logic_vector(15 downto 0);

component all_display_4_bits is
Port ( v: in std_logic_vector(15 downto 0);
clk : in std_logic;
dp: out std_logic;
seg: out std_logic_vector (6 downto 0);
an : out std_logic_vector(3 downto 0));
end component;

component seconds_counter is
Port (clk : in std_logic;
sw :in std_logic_vector(3 downto 0);
m:out integer:= 0;
s1:out integer:= 0;
s0:out integer:= 0;
t:out integer:= 0);
end component;

component time_to_16 is
Port ( m: in integer;
s1: in integer;
s0: in integer;
t: in integer;
v_final : out std_logic_vector(15 downto 0));
end component;

begin
UUT1 : seconds_counter port map(clk=>clk,m=>m,s1=>s1,s0=>s0,t=>t,sw=>sw);
UUT2: time_to_16 port map(m=>m,s1=>s1,s0=>s0,t=>t,v_final => v);
UUT3 : all_display_4_bits port map(clk=>clk,an=>an,dp=>dp,v=>v,seg=>seg);
end Behavioral;