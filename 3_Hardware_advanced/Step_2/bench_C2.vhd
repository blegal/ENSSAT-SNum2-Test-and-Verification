--
-- EN325-Advanced-digital-design teaching lab.
-- 
-- Copyright (C) { 2021 }  { Bertrand LE GAL} { Bordeaux-INP }
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.all;
library work;
use work.all;

ENTITY bench_C2 IS
END bench_C2;

ARCHITECTURE bench OF bench_C2 IS

component C2
   port( A : in signed(7 downto 0);
	B 	: in signed(7 downto 0);
	Cd : in Std_Logic;	-- Signal de commande du tri-state
	Clk : in Std_Logic;	-- Signal d'horloge
	S	: out signed(15 downto 0)) ;
   end component;

 signal As, Bs : signed(7 downto 0);
 signal Cds, Clks : std_logic;
 signal Ss : signed(15 downto 0);

begin

 cC2 : C2 port map (As, Bs, Cds, Clks, Ss);

process
	begin
			As <= (others =>'0');
		   Bs <= (others =>'0');
		   Cds <='1';
		   Clks <= '0';
			WAIT FOR 10 ns;
			
			-- A vous de completer
			
			
			WAIT FOR 10 ns;
			As <= "00000011";
		   Bs <= "00000001";
		   Clks <= '1';
			WAIT FOR 10 ns;
			Clks <= '0';
			Cds <='0';
			WAIT FOR 10 ns;
			As <= "00000010";
			Bs <= "00000001";
		   Clks <= '1';
			WAIT FOR 10 ns;
			Clks <= '0';
			Cds <='0';
			WAIT FOR 10 ns;
			As <= "00000000";
			Bs <= "00000001";
		   Clks <= '1';
		   WAIT FOR 10 ns;
			Clks <= '0';
			Cds <='0';
			WAIT FOR 10 ns;
			As <= "00000011";
			Bs <= "00000001";
		   Clks <= '1';
			WAIT FOR 10 ns;
	wait;
end process;

end bench;

configuration C2_cfg of bench_C2 is

	for bench
		for cC2 :C2
			use entity work.C2(comportementale);
		end for;
	end for;

end C2_cfg;