----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2023 11:15:27
-- Design Name: 
-- Module Name: ProgramCounter_tb - Behavioral
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

entity ProgramCounter_tb is
end ProgramCounter_tb;

architecture Behavioral of ProgramCounter_tb is

    constant clk_period : time := 10 ns;
    
    signal rst : std_logic := '0';
    signal clk : std_logic := '0';
    signal PCIN  : std_logic_vector (31 downto 0);
    signal PCOUT : std_logic_vector (31 downto 0);
    
    component ProgramCounter  
    Port (
            PCIn : in  std_logic_vector (31 downto 0);
            PCOut: out std_logic_vector (31 downto 0);
            clk, rst : in std_logic
       );
    end component;
    
begin

    clk <= not clk after clk_period / 2;

    uut : ProgramCounter port map (
        clk   => clk,
        rst   => rst,
        PCIn  => PCIn,
        PCOut => PCOut
    );

    tb: process begin 
        rst <= '0';
        PCIN <= X"00000000";
        wait for clk_period;
        assert PCOUT = X"00000000" report "Output is not as expected" severity error;
        
        rst <= '0';
        PCIN <= X"01000000";
        wait for clk_period;
        assert PCOUT = X"01000000" report "Output is not as expected" severity error;
        
        rst <= '1';
        PCIN <= X"01000000";
        wait for clk_period;
        assert PCOUT = X"00000000" report "Output is not as expected" severity error;
        
        wait;
        
    end process;


end Behavioral;
