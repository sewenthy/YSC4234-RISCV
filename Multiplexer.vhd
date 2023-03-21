----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2023 11:10:54
-- Design Name: 
-- Module Name: Multiplexer - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexer is
    Port ( 
        MUXIN1 : in std_logic_vector(31 downto 0);
        MUXIN2 : in std_logic_vector(31 downto 0);
        SEL    : in std_logic;
        MUXOUT :  out std_logic_vector(31 downto 0)
    );
end Multiplexer;

architecture Behavioral of Multiplexer is

begin

    MUXOUT <= MUXIN1 WHEN SEL = '0' else
              MUXIN2 WHEN SEL = '1';

end Behavioral;
