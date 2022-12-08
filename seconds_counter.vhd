----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 29.10.2022 10:17:45
-- Design Name:
-- Module Name: seconds_counter - Behavioral
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

entity seconds_counter is
Port (clk : in std_logic;
sw :in std_logic_vector(3 downto 0);
m:out integer:= 0;
s1:out integer:= 0;
s0:out integer:= 0;
t:out integer:= 0);
end seconds_counter;

architecture Behavioral of seconds_counter is
signal ctr: integer:=0;
signal minute:integer:= 0;
signal second1:integer:= 0;
signal second0:integer:= 0;
signal tenth:integer:= 0;

signal pause : std_logic:='0';
signal start : std_logic:='0';

signal prev0: std_logic:='0';
signal prev1: std_logic:='0';
signal prev2: std_logic:='0';
signal prev3: std_logic:='0';

begin

process (clk,ctr,start,pause,prev0,prev1,prev2,prev3)
begin

-------------------------------------
if sw(0) = '1' and prev0 = '0' then
    if start = '0' and pause = '0' then
        start <= '1';
    end if;
    prev0 <= '1';
elsif sw(0) = '0' and prev0 = '1' then
    prev0 <= '0';
end if;

if sw(1) = '1' and prev1 = '0' then
    if start = '1' and pause = '0' then
        pause <= '1';
    end if;
    prev1 <= '1';
elsif sw(1) = '0' and prev1 = '1' then
    prev1 <= '0';
end if;

if sw(2) = '1' and prev2 = '0' then
    if start = '1' and pause = '1' then
        pause <= '0';
    end if;
    prev2 <= '1';
elsif sw(2) = '0' and prev2 = '1' then
    prev2 <= '0';
end if;

if sw(3) = '1' and prev3 = '0' then
    if start = '1' then
        start <= '0';
        pause <= '0';
    end if;
    prev3 <= '1';
elsif sw(3) = '0' and prev3 = '1' then
    prev3 <= '0';
end if;
--------------------------------

if start = '0' then
t <= 0;
tenth <= 0;
s0 <= 0;
second0 <= 0;
s1 <= 0;
second1 <= 0;
m <= 0;
minute <= 0;
end if;

if start = '1' and pause = '0' then
    if rising_edge(clk) then
        if ctr = 10000000 then
        ctr <= 0;

            if minute = 9 and second1 = 5 and second0 = 9 and tenth=9 then
            t <= 0;
            tenth <= 0;
            s0 <= 0;
            second0 <= 0;
            s1 <= 0;
            second1 <= 0;
            m <= 0;
            minute <= 0;

            elsif second1 = 5 and second0 = 9 and tenth=9 then
            t <= 0;
            tenth <= 0;
            s0 <= 0;
            second0 <= 0;
            s1 <= 0;
            second1 <= 0;
            m <= minute + 1;
            minute <= minute +1;

            elsif second0 = 9 and tenth=9 then
            t <= 0;
            tenth <= 0;
            s0 <= 0;
            second0 <= 0;
            s1 <= second1+1;
            second1 <= second1+1;

            elsif tenth=9 then
            t <= 0;
            tenth <= 0;
            s0 <= second0+1;
            second0 <= second0+1;

            else
            t <= tenth+1;
            tenth <= tenth+1;
            end if;

        else
        ctr <= ctr + 1;
        end if;
    end if;
end if;
end process;
end Behavioral;