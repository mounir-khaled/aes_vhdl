--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:19:20 10/12/2017
-- Design Name:   
-- Module Name:   E:/aes128/sboxTest.vhd
-- Project Name:  aes128
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sbox
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sboxTest IS
END sboxTest;
 
ARCHITECTURE behavior OF sboxTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sbox
    PORT(
         clk : IN  std_logic;
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal d : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sbox PORT MAP (
          clk => clk,
          d => d,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		d <= X"00";
		
		wait for clk_period*10;
		d <= X"63";

      -- insert stimulus here 

      wait;
   end process;

END;
