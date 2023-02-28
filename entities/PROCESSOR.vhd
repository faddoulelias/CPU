library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PROCESSOR is
    Port (
        CLK : in std_logic;
        RESET : in std_logic;
        REG_WRITE : in std_logic;
        RW : in std_logic_vector(3 downto 0);
        RA : in std_logic_vector(3 downto 0);
        RB : in std_logic_vector(3 downto 0);
        IMM : in std_logic_vector(7 downto 0);
        ALU_SRC : in std_logic;
        ALU_CTR : in std_logic_vector(1 downto 0);
        MEM_WR : in std_logic;
        WR_SRC : in std_logic;
        FLAG : out std_logic
    );
end PROCESSOR;

architecture Behavioral of PROCESSOR is
    signal busA : std_logic_vector(31 downto 0);
    signal busB : std_logic_vector(31 downto 0);
    signal busW : std_logic_vector(31 downto 0);
    signal extended : std_logic_vector(31 downto 0);
    signal aluIN2 : std_logic_vector(31 downto 0);
    signal aluOUT : std_logic_vector(31 downto 0);
    signal DataOUT : std_logic_vector(31 downto 0);
begin
    REG16B32 : entity work.REG16B32 port map (
        CLK => CLK,
        RESET => RESET,
        W => busW,
        WE => REG_WRITE,
        RW => RW,
        RA => RA,
        RB => RB,
        A => busA,
        B => busB
    ); 

    EXT8T32 : entity work.EXTNT32 generic map (
        N => 8
    ) port map (
        E => IMM,
        S => extended
    );

    MUX2T32 : entity work.MUX2TN generic map (
        N => 32
    ) port map (
        A => busB,
        B => extended,
        COM => ALU_SRC,
        S => aluIN2
    );

    ALU : entity work.ALU port map (
        OP => ALU_CTR,
        BUS_A => busA,
        BUS_B => aluIN2,
        ALU_OUT => aluOUT,
        N => FLAG
    );

    MEM64B32 : entity work.MEM64B32 port map (
        CLK => CLK,
        RST => RESET,
        DATA_IN => busB,
        DATA_OUT => DataOUT,
        ADDR => aluOUT(5 downto 0),
        WE => MEM_WR
    );

    MUX2T32_1 : entity work.MUX2TN generic map (
        N => 32
    ) port map (
        A => aluOUT,
        B => DataOUT,
        COM => WR_SRC,
        S => busW
    );

end Behavioral;