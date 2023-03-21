----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2023 11:45:50
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
  Port ( 
    Operand1 : in  std_logic_vector (31 downto 0);
    Operand2 : in  std_logic_vector (31 downto 0);
    Result   : out std_logic_vector (31 downto 0);
    ALUop    : in  std_logic_vector (2 downto 0)
  );
end ALU;

architecture Behavioral of ALU is
signal addition : std_logic_vector(32 downto 0);
begin

addition <= std_logic_vector(signed(Operand1) + signed(Operand2));
RESULT <= addition(31 downto 0)  when ALUOp = "000" else
          Operand1 xor Operand2  when ALUOp = "001" else
          Operand1 and Operand2  when ALUOp = "010" else
          X"00000000" ;
end Behavioral;
