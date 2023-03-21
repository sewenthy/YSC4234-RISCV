library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
Port (
    clk : in std_logic;
    rst : in std_logic;
    writeReg : in std_logic;
    sourceReg1 : in std_logic_vector(4 downto 0);
    sourceReg2 : in std_logic_vector(4 downto 0);
    destinyReg : in std_logic_vector(4 downto 0);
    data : in std_Logic_vector(31 downto 0);
   
    readData1 : out std_logic_vector(31 downto 0);
    readData2 : out std_logic_vector(31 downto 0)
);
end RegisterFile;

architecture Behavioral of RegisterFile is

type array_type is array (0 to 31) of std_logic_vector(31 downto 0);
signal my_array : array_type;

begin

write_process : process(clk) is
begin
    if (rst = '1') then
        my_array <= (others => (others => '0'));
    elsif (rising_edge(clk)) then
        if (writeReg = '1') then
            my_array(to_integer(unsigned(destinyReg))) <= data;
        else
            readData1 <= my_array(to_integer(unsigned(sourceReg1)));
            readData2 <= my_array(to_integer(unsigned(sourceReg2)));
        end if;
    end if;
end process;

end Behavioral;