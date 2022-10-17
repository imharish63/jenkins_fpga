----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2022 02:08:37 PM
-- Design Name: 
-- Module Name: fsm - Behavioral
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity fsm is
    Port ( clk : in STD_LOGIC;
           reset_n : in STD_LOGIC;
           ext_reset : in STD_LOGIC;
           switches : in STD_LOGIC_VECTOR (3 downto 0);
           leds : out STD_LOGIC_VECTOR (3 downto 0));
end fsm;

architecture Behavioral of fsm is
type state_type is (idle,final) ; -- 2 states
signal state_cur, state_next : state_type;
signal led_reg : std_logic_vector (3 downto 0) := (others => '0');
begin
    process(clk, reset_n) 
    begin
        if ((reset_n = '0') and (ext_reset = '1')) then
            -- Reset values --
            state_cur <= idle;
        elsif rising_edge (clk) then
            state_cur <= state_next;
        end if;
    end process;
    
    process(state_cur,switches)
    begin
       state_next <= state_cur;
       
       case state_cur is 
        when idle => -- if idle state
            if (switches /= X"0")  then
                state_next <= final;
            else
                led_reg <= X"0";
                state_next <= idle;
            end if;
        when final =>
            if (switches /= X"0" ) then
                led_reg <= switches;
                state_next <= final;
            else
                state_next <= idle;
            end if;
        
        end case;                                
    end process;
    
    -- assign the led output the led wire
    leds <= led_reg;
                
end Behavioral;
