library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity INM64B32 is 
    port(
        CLK : in std_logic;
        RST : in std_logic;
        DATA_OUT : out std_logic_vector(31 downto 0);
        ADDR : in std_logic_vector(31 downto 0)
    );
end INM64B32;

architecture behavorial of INM64B32 is 
    type A64X32 is array(0 to 63) of std_logic_vector(31 downto 0);
    
    function code return A64X32 is
        variable result : A64X32;
        begin
            result(0)  := x"00000000";  -- NOP                    -- 0
            result(1)  := x"010fe000";  -- MOV  [15] [14]         -- 15:48; 14:48
            result(2)  := x"020fed00";  -- ADD  [15] [14] [13]    -- 15:48; 14:48; 13:96
            result(3)  := x"030edc00";  -- SUB  [14] [13] [12]    -- 14:48; 13:96; 12:-48
            result(4)  := x"040cb078";  -- ADDi [12] [11] 120     -- 12:-48; 11:72
            result(5)  := x"050bb002";  -- SUBi [11] [11] 2       -- 11:70
            result(6)  := x"060b0002";  -- STR  [11] {02}         -- 11:70 -> {2:70}
            result(7)  := x"070a0002";  -- LDR  [10] {02}         -- {2:70} -> 10:70
            result(8)  := x"0809005f";  -- SET  [9] 95            -- 9:95
            result(9)  := x"090bd000";  -- CMP  [11] [13]         -- PSR[N] = 1
            result(10) := x"0b000003";  -- BLT  3                 -- to command 13
            result(11) := x"00000000";  -- NOP                    -- 0
            result(12) := x"00000000";  -- NOP                    -- 0
            result(13) := x"040bb078";  -- ADDi [11] [11] 120     -- 11:190
            result(14) := x"090bd000";  -- CMP  [11] [13]         -- PSR[N] = 0
            result(15) := x"0b000003";  -- BLT  3                 -- WILL NOT BE EXECUTED (PSR[N] = 0)
            result(16) := x"0afffff2";  -- BAL  -14               -- to command 2
            result(17 to 63) := (others => (others => '0')); -- NOP
        return result;
    end code;

    signal Bench : A64X32 := code;
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                Bench <= code;
            end if;
        end if;
    end process;
    
    DATA_OUT <= Bench(to_integer(unsigned(ADDR)));
end behavorial;