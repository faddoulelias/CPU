-- port maps INM64B32.vhd
-- port maps PCT24B32.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity INSTRUCTOR is
    port (
        CLK : in std_logic := '0';
        RST : in std_logic := '0';

        nPCsel : in std_logic := '0';
        OFFSET : in std_logic_vector(23 downto 0) := (others => '0');
        
        INSTRUCTION : out std_logic_vector(31 downto 0) := (others => '0')
    );
end INSTRUCTOR;

architecture Behavioral of INSTRUCTOR is
    signal addr : std_logic_vector(31 downto 0);
begin
    PCT24B32 : entity work.PCT24B32
    port map(
        CLK => CLK,
        RST => RST,
        OFFSET => OFFSET,
        nPCsel => nPCsel,
        COUNTER => addr
    );

    INM64B32 : entity work.INM64B32
    port map(
        CLK => CLK,
        RST => RST,
        DATA_OUT => INSTRUCTION,
        ADDR => addr
    );

end Behavioral;