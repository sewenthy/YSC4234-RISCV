----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2023 11:10:12
-- Design Name: 
-- Module Name: c_addsub_0 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add4 is
    PORT (
        A : IN std_logic_vector(31 downto 0);
        S : OUT std_logic_vector(31 downto 0)
    );
end add4;

architecture Behavioral of add4 is

begin
    S <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) + 4, 32));
end Behavioral;
