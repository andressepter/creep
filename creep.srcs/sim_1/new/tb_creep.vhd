
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HexDisplay_tb is
end HexDisplay_tb;

architecture Behavioral of HexDisplay_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component HexDisplay
        Port ( SW : in STD_LOGIC_VECTOR (7 downto 0);
               AN : out STD_LOGIC_VECTOR (7 downto 0);
               CA, CB, CC, CD, CE, CF, CG : out STD_LOGIC);
    end component;

    -- Testbench signals
    signal SW : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal AN : STD_LOGIC_VECTOR (7 downto 0);
    signal CA, CB, CC, CD, CE, CF, CG : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: HexDisplay
        Port map (
            SW => SW,
            AN => AN,
            CA => CA,
            CB => CB,
            CC => CC,
            CD => CD,
            CE => CE,
            CF => CF,
            CG => CG
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Display 0
        SW <= "00000000";
        wait for 10 ns;
        
        -- Test case 2: Display 1
        SW <= "00000001";
        wait for 10 ns;
        
        -- Test case 3: Display 2
        SW <= "00000010";
        wait for 10 ns;
        
        -- Test case 4: Display 3
        SW <= "00000011";
        wait for 10 ns;
        
        -- Test case 5: Display 4
        SW <= "00000100";
        wait for 10 ns;
        
        -- Test case 6: Display 5
        SW <= "00000101";
        wait for 10 ns;
        
        -- Test case 7: Display 6
        SW <= "00000110";
        wait for 10 ns;
        
        -- Test case 8: Display 7
        SW <= "00000111";
        wait for 10 ns;
        
        -- Test case 9: Display 8
        SW <= "00001000";
        wait for 10 ns;
        
        -- Test case 10: Display 9
        SW <= "00001001";
        wait for 10 ns;
        
        -- Test case 11: Display A
        SW <= "00001010";
        wait for 10 ns;
        
        -- Test case 12: Display B
        SW <= "00001011";
        wait for 10 ns;
        
        -- Test case 13: Display C
        SW <= "00001100";
        wait for 10 ns;
        
        -- Test case 14: Display D
        SW <= "00001101";
        wait for 10 ns;
        
        -- Test case 15: Display E
        SW <= "00001110";
        wait for 10 ns;
        
        -- Test case 16: Display F
        SW <= "00001111";
        wait for 10 ns;
        
        -- End of simulation
        wait;
    end process;
end Behavioral;
