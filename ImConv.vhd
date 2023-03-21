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

entity ImConv is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           imm : out STD_LOGIC_VECTOR (31 downto 0)
    );
end ImConv;

architecture Behavioral of ImConv is
signal op : std_logic_vector (6 downto 0) := "0000000";
signal a_out : std_logic_vector (31 downto 0) := (others => '0');
begin

    op <= a (6 downto 0);
    imm <= std_logic_vector(signed(unsigned(a_out)));
        
    a_out (4 downto 0)  <=  -- addi
                            a (24 downto 20) when (op = "0010011") else
                            -- lw
                            a (24 downto 20) when (op = "0000011") else                        
                            -- sw
                            a (11 downto 7) when (op = "0100011") else
                            -- add
                            "00000";
                            
    a_out (11 downto 5) <= -- addi
                            a (31 downto 25) when (op = "0010011") else
                            -- lw
                            a (31 downto 25) when (op = "0000011") else                        
                            -- sw
                            a (31 downto 25) when (op = "0100011") else
                            -- add
                            "0000000";

end Behavioral;
