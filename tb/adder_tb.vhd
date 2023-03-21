----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 11:11:17 AM
-- Design Name: 
-- Module Name: adder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
component adder is Port(
   a : in std_logic_vector (31 downto 0);
   b : in std_logic_vector (31 downto 0);
   r : out std_logic_vector (31 downto 0)
); end component;

signal sig_a : std_logic_vector (31 downto 0);
signal sig_b : std_logic_vector (31 downto 0);
signal sig_r : std_logic_vector (31 downto 0);

begin

test1 : adder Port map (a=>sig_a, b=>sig_b, r=>sig_r);
tb_simple : process begin 
--            sig_a <= std_logic_vector(to_unsigned(0, sig_a'length));
--            sig_b <= std_logic_vector(to_unsigned(1, sig_b'length));
--            wait for 100 ns;
--            assert(sig_r = std_logic_vector(to_unsigned(1, sig_r'length)))
--                report "test add 0 1 failed"
----                severity error;
            
            for i in 100 downto 0 loop 
                for j in 100 downto 0 loop
                    sig_a <= std_logic_vector(to_unsigned(i, sig_a'length));
                    sig_b <= std_logic_vector(to_unsigned(j, sig_b'length));
                    wait for 100 ns;
                    assert(sig_r = std_logic_vector(to_unsigned(i+j, sig_r'length)))
                        report "test add i j failed ur bad"
                        severity error;
                end loop;
            end loop;
            wait; 
            end process;
                

end Behavioral;
