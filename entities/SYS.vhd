library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SYS is
    port(
        CLK: in std_logic;
        RESET: in std_logic
    );
end SYS;

architecture Behavioral of SYS is
    signal nPCsel : std_logic;
    signal OFFSET : std_logic_vector(23 downto 0);
    signal INSTRUCTION : std_logic_vector(31 downto 0);
begin
    CPU_0 : entity work.CPU port map (
        CLK => CLK,
        RESET => RESET,
        INSTRUCTION => INSTRUCTION,
        N_PC_SEL => nPCsel,
        OFFSET => OFFSET
    );

    INSTRUCTOR_0 : entity work.INSTRUCTOR port map (
        CLK => CLK,
        RST => RESET,
        nPCsel => nPCsel,
        OFFSET => OFFSET,
        INSTRUCTION => INSTRUCTION
    );
end Behavioral;