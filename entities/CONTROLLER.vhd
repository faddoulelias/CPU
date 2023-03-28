library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CONTROLLER is
    Port (
        CLK : in std_logic;
        RST : in std_logic;
        WE : in std_logic;
        DATA_IN : in std_logic_vector(31 downto 0);
        DATA_OUT : out std_logic_vector(31 downto 0)
    );
end CONTROLLER;

architecture Behavioral of CONTROLLER is
    signal data : std_logic_vector(31 downto 0);
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            data <= (others => '0');
        elsif rising_edge(CLK) then
            if WE = '1' then
                data <= DATA_IN;
            end if;
        end if;
    end process;
    DATA_OUT <= data;
end Behavioral;
