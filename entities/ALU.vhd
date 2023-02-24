library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port (
        OP : in std_logic_vector(1 downto 0);
        BUS_A, BUS_B : in std_logic_vector(31 downto 0);
        ALU_OUT : out std_logic_vector(31 downto 0);
        N : out std_logic
    );
end ALU;

architecture Behavioral of ALU is
    signal Y : std_logic_vector(31 downto 0);
begin
    process(OP, BUS_A, BUS_B)
    begin
        case OP is
            when "00" => Y <= std_logic_vector(signed(BUS_A) + signed(BUS_B));
            when "01" => Y <= BUS_B;
            when "10" => Y <=  std_logic_vector(signed(BUS_A) - signed(BUS_B));
            when "11" => Y <= BUS_A;
            when others => Y <= (others => '0');
        end case;
    end process;
    N <= Y(31);
    ALU_OUT <= Y;
end Behavioral;