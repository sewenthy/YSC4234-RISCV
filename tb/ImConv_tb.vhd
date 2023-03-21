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
signal ins0 : std_logic_vector(31 downto 0);
signal imm0 : std_logic_vector(31 downto 0);
signal ins1 : std_logic_vector(31 downto 0);
signal imm1 : std_logic_vector(31 downto 0);
signal ins2 : std_logic_vector(31 downto 0);
signal imm2 : std_logic_vector(31 downto 0);
signal ins3 : std_logic_vector(31 downto 0);
signal imm3 : std_logic_vector(31 downto 0);
begin
    test0 : ImConv Port map (a=>ins0, imm=>imm0);
    tb_lw : process begin 
        for i in 50 downto -50 loop 
            ins0 <= ins_init;
            ins0 (6 downto 0) <= lw_op;
            ins0 (31 downto 20) <= std_logic_vector(to_signed(i, 12));
            wait for 100 ns;
            assert(TO_INTEGER(signed(imm0)) = i)
                report "test lw failed ur bad: got " & integer'image(TO_INTEGER(signed(imm0))) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
    test1 : ImConv Port map (a=>ins1, imm=>imm1);
    tb_add1 : process begin 
        for i in 50 downto -50 loop 
            ins1 <= ins_init;
            ins1 (6 downto 0) <= addi_op;
            ins1 (31 downto 20) <= std_logic_vector(to_signed(i, 12));
            wait for 100 ns;
            assert(TO_INTEGER(signed(imm1)) = i)
                report "test addi failed ur bad: got " & integer'image(TO_INTEGER(signed(imm1))) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
    test2 : ImConv Port map (a=>ins2, imm=>imm2);
    tb_sw : process 
    variable tmp : std_logic_vector (11 downto 0);
    begin 
        for i in 50 downto -50 loop 
            ins2 <= ins_init;
            ins2 (6 downto 0) <= addi_op;
            tmp := std_logic_vector(to_signed(i, 12));
            ins2 (11 downto 7) <= tmp (4 downto 0);
            ins2 (31 downto 25) <= tmp (11 downto 5);
            wait for 100 ns;
            assert(TO_INTEGER(signed(imm2)) = i)
                report "test sw failed ur bad : got " & integer'image(TO_INTEGER(signed(imm2))) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
    test3 : ImConv Port map (a=>ins3, imm=>imm3);
    tb_unsupported : process begin 
        for i in 100 downto 0 loop 
            ins3 <= ins_init;
            ins3 (6 downto 0) <= rand_op;
            ins3 (11 downto 0) <= std_logic_vector(to_signed(i, 12));
            wait for 100 ns;
            assert(TO_INTEGER(signed(imm3)) = 0)
                report "test unsupported failed ur bad : got " & integer'image(TO_INTEGER(signed(imm3))) & " expected: "& integer'image(i)
                severity error;
        end loop;
        wait; 
    end process;
end Behavioral;
