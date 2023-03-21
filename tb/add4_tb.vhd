library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add4_tb is
end Add4_tb;

architecture Behavioral of Add4_tb is

COMPONENT Add4_tb is
Port(
    A : in std_logic_vector(31 downto 0);
    S : out std_logic_vector(31 downto 0)
);
end COMPONENT;

signal A : std_logic_vector(31 downto 0);
signal S : std_logic_vector(31 downto 0);

begin

tb_proc : process
begin

-- test 1
A <= "00000000000000000000000000000000";
wait for 100ns;
assert(S = "00000000000000000000000000000100") report "test 1 failed" severity error;

-- test 2
A <= "00000000000000000000000000000100";
wait for 100ns;
assert(S = "00000000000000000000000000001000") report "test 2 failed" severity error;

-- test 3
A <= "00000000000000000000000000001000";
wait for 100ns;
assert(S = "00000000000000000000000000001100") report "test 3 failed" severity error;

-- test 4
A <= "01100110011000111000011110000000";
wait for 100ns;
assert(S = "01100110011000111000011110000100") report "test 4 failed" severity error;

-- test 5
A <= "11000101101110010111100110011010";
wait for 100ns;
assert(S = "11000101101110010111100110011110") report "test 5 failed" severity error;

-- test 6
A <= "10001100100000100100011011110111";
wait for 100ns;
assert(S = "10001100100000100100011011111011") report "test 6 failed" severity error;


wait;
end process;

end Behavioral;
