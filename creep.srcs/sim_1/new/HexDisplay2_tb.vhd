
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HexDisplay_tb is
end HexDisplay_tb;

architecture Behavioral of HexDisplay_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component HexDisplay
        Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
               AN : out STD_LOGIC_VECTOR (7 downto 0);
               CA, CB, CC, CD, CE, CF, CG : out STD_LOGIC;
               CLK : in STD_LOGIC);
    end component;

    -- Testbench signals
    signal SW : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal AN : STD_LOGIC_VECTOR (7 downto 0);
    signal CA, CB, CC, CD, CE, CF, CG : STD_LOGIC;
    signal CLK : STD_LOGIC := '0';

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

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
            CG => CG,
            CLK => CLK
        );

    -- Clock process definitions
    clk_process :process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Display 0
        SW <= "0000";
        wait for 100 ns;
        
        -- Test case 2: Display 1
        SW <= "0001";
        wait for 100 ns;
        
        -- Test case 3: Display 2
        SW <= "0010";
        wait for 100 ns;
        
        -- Test case 4: Display 3
        SW <= "0011";
        wait for 100 ns;
        
        -- Test case 5: Display 4
        SW <= "0100";
        wait for 100 ns;
        
        -- Test case 6: Display 5
        SW <= "0101";
        wait for 100 ns;
        
        -- Test case 7: Display 6
        SW <= "0110";
        wait for 100 ns;
        
        -- Test case 8: Display 7
        SW <= "0111";
        wait for 100 ns;
        
        -- Test case 9: Display 8
        SW <= "1000";
        wait for 100 ns;
        
        -- Test case 10: Display 9
        SW <= "1001";
        wait for 100 ns;
        
        -- Test case 11: Display A
        SW <= "1010";
        wait for 100 ns;
        
        -- Test case 12: Display B
        SW <= "1011";
        wait for 100 ns;
        
        -- Test case 13: Display C
        SW <= "1100";
        wait for 100 ns;
        
        -- Test case 14: Display D
        SW <= "1101";
        wait for 100 ns;
        
        -- Test case 15: Display E
        SW <= "1110";
        wait for 100 ns;
        
        -- Test case 16: Display F
        SW <= "1111";
        wait for 100 ns;
        
        -- End of simulation
        wait;
    end process;
end Behavioral;
