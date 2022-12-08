library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is
component timer_display is
Port ( clk: in std_logic;
    sw : in std_logic_vector (3 downto 0);
    an : out std_logic_vector(3 downto 0);
    seg : out std_logic_vector(6 downto 0);
    dp : out std_logic
);
end component;

signal seg: std_logic_vector(0 to 6);
signal start,pause,continue,reset: std_logic := '0';
signal clk : std_logic :='0';
signal an : std_logic_vector(0 to 3);
signal dp: std_logic;
constant clk_period : time := 10ns;
begin

clk_process: process
begin
    clk<='0';
    wait for clk_period/2;
    clk<='1';
    wait for clk_period/2;
end process;

start_process: process
begin
    start<='1';
    wait for 250 ns;
    start<='0';
    wait for 750 ns;
end process;

pause_process: process
begin
    pause<='0';
    wait for 250 ns;
    pause<='1';
    wait for 250 ns;
    pause<='0';
    wait for 500 ns;
end process;

continue_process: process
begin
    continue<='0';
    wait for 500 ns;
    continue<='1';
    wait for 250 ns;
    continue<='0';
    wait for 250 ns;
end process;

reset_process: process
begin
    reset<='0';
    wait for 750 ns;
    reset<='1';
    wait for 250 ns;
end process;

UUT : timer_display port map(sw(0)=>start, sw(1)=>pause,sw(2)=>continue,sw(3)=>reset,clk=>clk,seg=>seg,dp=>dp,an=>an);
end Behavioral;