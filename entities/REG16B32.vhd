library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity REG16B32 is
    port (
        CLK : in std_logic;
        RESET : in std_logic;
        W : in std_logic_vector(31 downto 0);
        WE : in std_logic;
        RW : in std_logic_vector(3 downto 0);
        RA : in std_logic_vector(3 downto 0);
        RB : in std_logic_vector(3 downto 0);
        A : out std_logic_vector(31 downto 0);
        B : out std_logic_vector(31 downto 0)
    );
end entity REG16B32;

architecture Behavioral of REG16B32 is
    type A16X32 is array(15 downto 0) of std_logic_vector(31 downto 0);
    
    function init_A16X32 return A16X32 is
        variable result : A16X32;
        begin
            for i in 14 downto 0 loop
                result(i) := (others=>'0');
            end loop;
            result(15):=X"00000030";
        return result;
    end init_A16X32;

    signal Bench : A16X32 := init_A16X32;
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if WE = '1' then
                Bench(to_integer(unsigned(RW))) <= W;
            end if;

            if RESET = '1' then
                Bench <= init_A16X32;
            end if;
        end if;
    end process;
    A <= Bench(to_integer(unsigned(RA)));
    B <= Bench(to_integer(unsigned(RB)));
end architecture Behavioral;
