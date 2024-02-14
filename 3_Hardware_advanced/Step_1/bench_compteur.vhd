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
library work;
use work.all;

ENTITY bench_compteur IS
END bench_compteur;

ARCHITECTURE bench OF bench_compteur IS

COMPONENT compteur
port (reset : in Std_Logic;
      clk   : in Std_Logic;
      up : in Std_Logic;
     output : out Std_Logic_vector(3 downto 0 )
      ) ;
end COMPONENT;

 signal resets,clks, ups : std_logic :='0';
 signal outputs: Std_Logic_vector(3 downto 0 );

begin

 cpt : compteur port map (resets,clks,ups, outputs);


compteur_sim : process
	begin
			resets <='0';
		    clks <='0';
		    ups <='0';
			
			WAIT FOR 10 ns;
			resets <='1';
		    clks <='0';
		    ups <='1';
		
			WAIT FOR 10 ns;
		    clks <='1';
		
		for i in 0 to 5 loop
			WAIT FOR 10 ns;
		    clks <='0';
			
			WAIT FOR 10 ns;
		    clks <='1';
		 end loop;
			
		   WAIT FOR 10 ns;
			resets <='0';
			clks <='0';
			ups <='0';
			
			WAIT FOR 5 ns;
			resets <='1';
			clks <='0';
			
			WAIT FOR 5 ns;
			resets <='1';
			clks <='1';
			
		for i in 0 to 3 loop
			WAIT FOR 10 ns;
		    clks <='0';
			
			WAIT FOR 10 ns;
		    clks <='1';
		 end loop;
		 	
	wait;
end process compteur_sim;

end bench;

configuration compteur_cfg of bench_compteur is

	for bench
		for cpt :compteur
			use entity work.compteur(comportementale);
		end for;
	end for;

end compteur_cfg;
