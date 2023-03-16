library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DECODER is
    Port (
        INSTRUCTION : in std_logic_vector(31 downto 0);
        PSR : in std_logic_vector(31 downto 0);

        PC : out std_logic_vector(31 downto 0);
        PSR_EN : out std_logic_vector(31 downto 0);
        RN : out std_logic_vector(3 downto 0);
        RD : out std_logic_vector(3 downto 0);
        RM : out std_logic_vector(3 downto 0);
        REG_WRITE : out std_logic;
        REG_SEL : out std_logic;
        ALU_CTR : out std_logic_vector(1 downto 0);
        ALU_SRC : out std_logic;
        WR_SRC : out std_logic;
        MEM_WRITE : out std_logic;
        PSR_WRITE : out std_logic;
        OFFSET : out std_logic_vector(23 downto 0);
        IMM : out std_logic_vector(31 downto 0);
    );
end DECODER;

architecture Behavioral of DECODER is
begin;
    process (INSTRUCTION)
    begin
        case( INSTRUCTION(31 downto 20) ) is
            when "111000101000" => -- ADDi
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                IMM <= INSTRUCTION(7 downto 0);

            when "111000001000" => --ADDr
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                RM <= INSTRUCTION(3 downto 0);

            when "111000111010" => --MOV
                RD <= INSTRUCTION(15 downto 12);
                IMM <= INSTRUCTION(7 downto 0);

            when "111000110101" => --CMP
                RN <= INSTRUCTION(19 downto 16);
                IMM <= INSTRUCTION(7 downto 0);

            when "111001100001" => --LDR
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                OFFSET <= INSTRUCTION(11 downto 0);

            when "111010100001" => --STR
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                OFFSET <= INSTRUCTION(11 downto 0);

            when "111001100000" =>
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                OFFSET <= INSTRUCTION(11 downto 0);

            when "111010100000" =>
                OFFSET <= INSTRUCTION(23 downto 0);

            when "101110100000" =>
                OFFSET <= INSTRUCTION(23 downto 0);

        end case ;
    end process;
end Behavioral;