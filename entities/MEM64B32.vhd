library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM64B32 is 
    port(
        CLK : in std_logic;
        RST : in std_logic;
        DATA_IN : in std_logic_vector(31 downto 0);
        DATA_OUT : out std_logic_vector(31 downto 0);
        ADDR : in std_logic_vector(31 downto 0);
        WE : in std_logic
    );
end MEM64B32;

architecture behavorial of MEM64B32 is 
    type A64X32 is array(0 to 63) of std_logic_vector(31 downto 0);
    signal Bench : A64X32 := (others => (others => '0'));
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                Bench <= (others => (others => '0'));
            end if;
            
            if WE = '1' then
                Bench(to_integer(unsigned(ADDR))) <= DATA_IN;
            end if;
        end if;
    end process;
    
    
    DATA_OUT <= Bench(to_integer(unsigned(ADDR(5 downto 0))));
end behavorial; 