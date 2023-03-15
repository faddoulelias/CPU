library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCT24B32 is 
    port(
        CLK : in std_logic;
        RST : in std_logic := '0';
        OFFSET : in signed(23 downto 0) := (others => '0');
        nPCsel : in std_logic := '0';
        COUNTER : out std_logic_vector(31 downto 0) := (others => '0')
    );
end PCT24B32;

architecture Behavioral of PCT24B32 is
    signal S0 : unsigned(31 downto 0) := (others => '0');
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            S0 <= (others => '0');
        elsif rising_edge(CLK) then
            if nPCsel = '1' then
                S0 <= unsigned(signed(S0) + OFFSET);
            else
                S0 <= S0 + 1;
            end if;
        end if;
    end process;
    COUNTER <= std_logic_vector(S0);
end Behavioral;