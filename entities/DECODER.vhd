library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DECODER is
    Port (
        INSTRUCTION : in std_logic_vector(31 downto 0) := (others => '0');
        PSR : in std_logic_vector(31 downto 0) := (others => '0');

        N_PC_SEL : out std_logic := '0';
        PSR_EN : out std_logic := '0';
        RN : out std_logic_vector(3 downto 0) := (others => '0'); --Ra
        RM : out std_logic_vector(3 downto 0) := (others => '0'); --Rb
        RD : out std_logic_vector(3 downto 0) := (others => '0'); --Rw
        REG_WRITE : out std_logic := '0';
        ALU_CTR : out std_logic_vector(1 downto 0) := "00";
        ALU_SRC : out std_logic := '0';
        WR_SRC : out std_logic := '0';
        MEM_WRITE : out std_logic := '0';
        OFFSET : out std_logic_vector(23 downto 0) := (others => '0');
        IMM : out std_logic_vector(7 downto 0) := (others => '0')
    );
end DECODER;

architecture Behavioral of DECODER is
begin
    process (INSTRUCTION)
    begin
        case INSTRUCTION(31 downto 24) is
            when "00000001" => --MOV
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                REG_WRITE <= '1';
                ALU_CTR <= "11";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= (others => '0');
            when "00000010" => --ADDr
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RN <= INSTRUCTION(19 downto 16);
                RM <= INSTRUCTION(15 downto 12);
                RD <= INSTRUCTION(11 downto 8);
                REG_WRITE <= '1';
                ALU_CTR <= "00";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= (others => '0');
            when "00000011" => --SUBr
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RN <= INSTRUCTION(19 downto 16);
                RM <= INSTRUCTION(15 downto 12);
                RD <= INSTRUCTION(11 downto 8);
                REG_WRITE <= '1';
                ALU_CTR <= "10";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= (others => '0');
            when "00000100" => --ADDi
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                REG_WRITE <= '1';
                ALU_CTR <= "00";
                ALU_SRC <= '1';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= INSTRUCTION(7 downto 0);
            when "00000101" => --SUBi
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RN <= INSTRUCTION(19 downto 16);
                RD <= INSTRUCTION(15 downto 12);
                REG_WRITE <= '1';
                ALU_CTR <= "10";
                ALU_SRC <= '1';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= INSTRUCTION(7 downto 0);
            when "00000110" => --STR
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RM <= INSTRUCTION(19 downto 16);
                REG_WRITE <= '0';
                ALU_CTR <= "01";
                ALU_SRC <= '1';
                WR_SRC <= '0';
                MEM_WRITE <= '1';
                OFFSET <= (others => '0');
                IMM <= INSTRUCTION(7 downto 0);
            when "00000111" => --LDR
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RD <= INSTRUCTION(19 downto 16);
                REG_WRITE <= '1';
                ALU_CTR <= "01";
                ALU_SRC <= '1';
                WR_SRC <= '1';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= INSTRUCTION(7 downto 0);
            when "00001000" => --SET
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RD <= INSTRUCTION(19 downto 16);
                REG_WRITE <= '1';
                ALU_CTR <= "01";
                ALU_SRC <= '1';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= INSTRUCTION(7 downto 0);
            when "00001001" => --CMP
                N_PC_SEL <= '0';
                PSR_EN <= '1';
                RN <= INSTRUCTION(19 downto 16);
                RM <= INSTRUCTION(15 downto 12);
                REG_WRITE <= '0';
                ALU_CTR <= "10";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= (others => '0');
            when "00001010" => --BAL
                N_PC_SEL <= '1';
                PSR_EN <= '0';
                REG_WRITE <= '0';
                ALU_CTR <= "01";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= INSTRUCTION(23 downto 0);
            when "00001011" => --BLT
                N_PC_SEL <= PSR(0);
                PSR_EN <= '0';
                REG_WRITE <= '0';
                ALU_CTR <= "01";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= INSTRUCTION(23 downto 0);
            when others =>
                N_PC_SEL <= '0';
                PSR_EN <= '0';
                RN <= (others => '0');
                RM <= (others => '0');
                RD <= (others => '0');
                REG_WRITE <= '0';
                ALU_CTR <= "00";
                ALU_SRC <= '0';
                WR_SRC <= '0';
                MEM_WRITE <= '0';
                OFFSET <= (others => '0');
                IMM <= (others => '0');
        end case;
    end process;
end Behavioral;