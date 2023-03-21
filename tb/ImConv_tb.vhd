----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 11:44:39 AM
-- Design Name: 
-- Module Name: ImConv_tb - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ImConv_tb is
--  Port ( );
end ImConv_tb;

architecture Behavioral of ImConv_tb is
COMPONENT ImConv is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           imm : out STD_LOGIC_VECTOR (31 downto 0)
    ); end COMPONENT;
signal rand_op: std_logic_vector (6 downto 0) := (others => '0');
signal addi_op: std_logic_vector (6 downto 0) := "0010011";
signal lw_op: std_logic_vector (6 downto 0) := "0000011";
signal sw_op: std_logic_vector (6 downto 0) := "0100011";
signal ins_init : std_logic_vector (31 downto 0) := (others => '0');
signal ins : std_logic_vector(31 downto 0);
signal imm : std_logic_vector(31 downto 0);
begin
    test1 : ImConv Port map (a=>ins, imm=>imm);
    tb_addi_lw : process begin 
        for i in 100 downto 0 loop 
            ins <= ins_init;
            ins (6 downto 0) <= addi_op;
            ins (31 downto 20) <= std_logic_vector(TO_SIGNED(i, 12));
            wait for 100 ns;
            assert(imm = std_logic_vector(TO_SIGNED(i, 12)))
                report "test addi failed ur bad: got " & integer'image(imm) & " expected: "& integer'image(i)
                severity error;
            ins (6 downto 0) <= lw_op;
            wait for 100 ns;
            assert(imm = std_logic_vector(TO_SIGNED(i, 12)))
                report "test lw failed ur bad: got " & integer'image(imm) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
    tb_sw : process 
    variable tmp : std_logic_vector (11 downto 0);
    begin 
        for i in 100 downto 0 loop 
            ins <= ins_init;
            ins (6 downto 0) <= addi_op;
            tmp := std_logic_vector(TO_SIGNED(i, 12));
            ins (11 downto 7) <= tmp (4 downto 0);
            ins (31 downto 25) <= tmp (11 downto 5);
            wait for 100 ns;
            assert(imm = std_logic_vector(TO_SIGNED(i, 12)))
                report "test sw failed ur bad: got " & integer'image(imm) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
    tb_unsupported : process begin 
        for i in 100 downto 0 loop 
            ins <= ins_init;
            ins (6 downto 0) <= rand_op;
            ins (11 downto 0) <= std_logic_vector(TO_SIGNED(i, 12));
            wait for 100 ns;
            assert(imm = std_logic_vector(TO_SIGNED(0, 12)))
                report "test unsupported failed ur bad: got " & integer'image(imm) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
end Behavioral;
