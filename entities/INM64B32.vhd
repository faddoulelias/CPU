library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity INM64B32 is 
    port(
        CLK : in std_logic;
        RST : in std_logic;
        DATA_OUT : out std_logic_vector(31 downto 0);
        ADDR : in std_logic_vector(5 downto 0)
    );
end INM64B32;

architecture behavorial of INM64B32 is 
    type A64X32 is array(0 to 63) of std_logic_vector(31 downto 0);
    signal Bench : A64X32 := (others => (others => '0'));
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                Bench <= (others => (others => '0'));
            end if;
        end if;
    end process;
    
    DATA_OUT <= Bench(to_integer(unsigned(ADDR)));
end behavorial;