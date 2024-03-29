library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PSR is
    Port ( DATAIN : in std_logic_vector(31 downto 0);
           RST : in std_logic;
           CLK : in std_logic;
           WE : in std_logic;
           DATAOUT : out std_logic_vector(31 downto 0) := (others => '0')
        );
end PSR;

architecture Behavioral of PSR is
    signal PSR : std_logic_vector(31 downto 0) := (others => '0');
begin
    process (CLK, RST)
    begin
        if (RST = '1') then
            PSR <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (WE = '1') then
                PSR <= DATAIN;
            end if;
        end if;
    end process;

    DATAOUT <= PSR;
end Behavioral;
