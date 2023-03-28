library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU is
    port(
        CLK: in std_logic;
        RESET: in std_logic;
        INSTRUCTION: in std_logic_vector(31 downto 0);

        N_PC_SEL_O : out std_logic;
        PSR_EN_O : out std_logic;
        REG_SEL_O : out std_logic;
        OFFSET_O : out std_logic_vector(23 downto 0);
        PSR_O : out std_logic_vector(31 downto 0);
        FLAG_O : out std_logic
    );
end CPU;

architecture Behavioral of CPU is
        signal N_PC_SEL: std_logic;
        signal PSR_EN: std_logic;
        signal RN: std_logic_vector(3 downto 0);
        signal RM: std_logic_vector(3 downto 0);
        signal RD: std_logic_vector(3 downto 0);
        signal REG_SEL: std_logic;
        signal REG_WRITE: std_logic;
        signal ALU_CTR: std_logic_vector(1 downto 0);
        signal ALU_SRC: std_logic;
        signal WR_SRC: std_logic;
        signal MEM_WRITE: std_logic;
        signal OFFSET: std_logic_vector(23 downto 0);
        signal IMM: std_logic_vector(7 downto 0);
        signal PSR: std_logic_vector(31 downto 0);
        signal FLAG: std_logic;
begin
    N_PC_SEL_O <= N_PC_SEL;
    PSR_EN_O <= PSR_EN;
    REG_SEL_O <= REG_SEL;
    OFFSET_O <= OFFSET;
    FLAG_O <= FLAG;
    PSR_O <= PSR;

    DECODER: entity work.DECODER
        Port Map (
            INSTRUCTION => INSTRUCTION,
            PSR => PSR,
            N_PC_SEL => N_PC_SEL,
            PSR_EN => PSR_EN,
            RN => RN,
            RM => RM,
            RD => RD,
            REG_SEL => REG_SEL,
            REG_WRITE => REG_WRITE,
            ALU_CTR => ALU_CTR,
            ALU_SRC => ALU_SRC,
            WR_SRC => WR_SRC,
            MEM_WRITE => MEM_WRITE,
            OFFSET => OFFSET,
            IMM => IMM
        );

    PROCESSOR: entity work.PROCESSOR
        Port Map (
            CLK => CLK,
            RESET => RESET,
            REG_WRITE => REG_WRITE,
            RA => RN,
            RB => RM,
            RW => RD,
            IMM => IMM,
            ALU_SRC => ALU_SRC,
            ALU_CTR => ALU_CTR,
            MEM_WR => MEM_WRITE,
            WR_SRC => WR_SRC,
            FLAG => FLAG
        );
end architecture;