library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add is
  Port ( 
    a : in STD_LOGIC_VECTOR (31 downto 0);
    b : in STD_LOGIC_VECTOR (31 downto 0);
    r : out STD_LOGIC_VECTOR (31 downto 0)
  );
end Add;

architecture Behavioral of Add is

begin

    r <= std_logic_vector(unsigned(a) + unsigned(b));

end Behavioral;
