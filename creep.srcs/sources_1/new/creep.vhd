
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HexDisplay is
    Port ( SW : in STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           CA, CB, CC, CD, CE, CF, CG : out STD_LOGIC;
           CLK : in STD_LOGIC);
end HexDisplay;

architecture Behavioral of HexDisplay is
    signal hex_digit : STD_LOGIC_VECTOR (3 downto 0);
    signal refresh_counter : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal display_select : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin
    -- Refresh counter to create a delay
    process(CLK)
    begin
        if rising_edge(CLK) then
            refresh_counter <= refresh_counter + 1;
            if refresh_counter = "1111111111111111" then
                display_select <= display_select + 1;
            end if;
        end if;
    end process;

    -- Multiplexer to select which display is active
    process(display_select)
    begin
        case display_select is
            when "00" =>
                AN <= "11111110"; -- AN0 active
                hex_digit <= SW(3 downto 0);
            when "01" =>
                AN <= "11111101"; -- AN1 active
                hex_digit <= SW(7 downto 4);
            when "10" =>
                AN <= "11111011"; -- AN2 active
                hex_digit <= "0000"; -- Placeholder for other displays
            when "11" =>
                AN <= "11110111"; -- AN3 active
                hex_digit <= "0000"; -- Placeholder for other displays
            when others =>
                AN <= "11111111"; -- All displays off
        end case;
    end process;

    -- Decode the hex_digit to the seven-segment display
    process(hex_digit)
    begin
        case hex_digit is
            when "0000" => -- 0
                CA <= '0'; CB <= '0'; CC <= '0'; CD <= '0'; CE <= '0'; CF <= '0'; CG <= '1';
            when "0001" => -- 1
                CA <= '1'; CB <= '0'; CC <= '0'; CD <= '1'; CE <= '1'; CF <= '1'; CG <= '1';
            when "0010" => -- 2
                CA <= '0'; CB <= '0'; CC <= '1'; CD <= '0'; CE <= '0'; CF <= '1'; CG <= '0';
            when "0011" => -- 3
                CA <= '0'; CB <= '0'; CC <= '0'; CD <= '0'; CE <= '1'; CF <= '1'; CG <= '0';
            when "0100" => -- 4
                CA <= '1'; CB <= '0'; CC <= '0'; CD <= '1'; CE <= '1'; CF <= '0'; CG <= '0';
            when "0101" => -- 5
                CA <= '0'; CB <= '1'; CC <= '0'; CD <= '0'; CE <= '1'; CF <= '0'; CG <= '0';
            when "0110" => -- 6
                CA <= '0'; CB <= '1'; CC <= '0'; CD <= '0'; CE <= '0'; CF <= '0'; CG <= '0';
            when "0111" => -- 7
                CA <= '0'; CB <= '0'; CC <= '0'; CD <= '1'; CE <= '1'; CF <= '1'; CG <= '1';
            when "1000" => -- 8
                CA <= '0'; CB <= '0'; CC <= '0'; CD <= '0'; CE <= '0'; CF <= '0'; CG <= '0';
            when "1001" => -- 9
                CA <= '0'; CB <= '0'; CC <= '0'; CD <= '0'; CE <= '1'; CF <= '0'; CG <= '0';
            when "1010" => -- A
                CA <= '0'; CB <= '0'; CC <= '0'; CD <= '1'; CE <= '0'; CF <= '0'; CG <= '0';
            when "1011" => -- B
                CA <= '1'; CB <= '1'; CC <= '0'; CD <= '0'; CE <= '0'; CF <= '0'; CG <= '0';
            when "1100" => -- C
                CA <= '0'; CB <= '1'; CC <= '1'; CD <= '0'; CE <= '0'; CF <= '0'; CG <= '1';
            when "1101" => -- D
                CA <= '1'; CB <= '0'; CC <= '0'; CD <= '0'; CE <= '0'; CF <= '1'; CG <= '0';
            when "1110" => -- E
                CA <= '0'; CB <= '1'; CC <= '1'; CD <= '0'; CE <= '0'; CF <= '0'; CG <= '0';
            when "1111" => -- F
                CA <= '0'; CB <= '1'; CC <= '1'; CD <= '1'; CE <= '0'; CF <= '0'; CG <= '0';
            when others =>
                CA <= '1'; CB <= '1'; CC <= '1'; CD <= '1'; CE <= '1'; CF <= '1'; CG <= '1';
        end case;
    end process;
end Behavioral;
