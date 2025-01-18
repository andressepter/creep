
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multi_7Segment_Display is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit input
           clk : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)); -- 4 anode control signals
end Multi_7Segment_Display;

architecture Behavioral of Multi_7Segment_Display is
    signal refresh_counter : INTEGER := 0;
    signal digit_select : INTEGER range 0 to 3 := 0;
begin
    -- Clock divider for refresh rate
    process(clk)
    begin
        if rising_edge(clk) then
            refresh_counter <= refresh_counter + 1;
            if refresh_counter = 100000 then -- Adjust this value for desired refresh rate
                refresh_counter <= 0;
                digit_select <= (digit_select + 1) mod 4;
            end if;
        end if;
    end process;

    -- Drive the anode signals
    process(digit_select)
    begin
        case digit_select is
            when 0 => an <= "1110"; -- Activate first display
            when 1 => an <= "1101"; -- Activate second display
            when 2 => an <= "1011"; -- Activate third display
            when 3 => an <= "0111"; -- Activate fourth display
            when others => an <= "1111"; -- All displays off
        end case;
    end process;

    -- Decode the 4-bit input to seven-segment display
    process(SW)
    begin
        case SW is
            when "0000" => AN <= "0000001"; -- 0
            when "0001" => AN <= "1001111"; -- 1
            when "0010" => AN <= "0010010"; -- 2
            when "0011" => AN <= "0000110"; -- 3
            when "0100" => AN <= "1001100"; -- 4
            when "0101" => AN <= "0100100"; -- 5
            when "0110" => AN <= "0100000"; -- 6
            when "0111" => AN <= "0001111"; -- 7
            when "1000" => AN <= "0000000"; -- 8
            when "1001" => AN <= "0000100"; -- 9
            when others => AN <= "1111111"; -- Blank
        end case;
    end process;
end Behavioral;
```

in this code:
- `SW` is a 4-bit input representing a single digit.
- The `refresh_counter` and `digit_select` signals are used to cycle through the displays, activating one at a time.
- The `an` signal controls which display is active.
- The `AN` signal drives the segments of the active display based on the `SW` value.

This setup ensures that all four displays show the same digit, with the control signals time-multiplexed to create the appearance of simultaneous display.

Would you like any further adjustments or explanations?