library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EXTNT32 is 
    generic (
        N : integer := 16
    );
    port(
        E : in std_logic_vector(N-1 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end EXTNT32;

architecture Behavioral of EXTNT32 is
begin
    S <= std_logic_vector(resize(Signed(E), S'length));
end Behavioral;