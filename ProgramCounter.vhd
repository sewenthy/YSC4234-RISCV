----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2023 11:10:54
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
      Port (
            PCIn : in  std_logic_vector (31 downto 0);
            PCOut: out std_logic_vector (31 downto 0);
            clk, rst : in std_logic
       );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
begin

process(clk, rst) begin
     if (rst = '1') then
        PCOut <= X"00000000";
     elsif rising_edge(clk) then
        PCOut <= PCIn;
     end if;
end process;


end Behavioral;
