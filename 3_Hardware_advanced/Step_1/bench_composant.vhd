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
library work;
use work.all;

ENTITY bench_composent IS
END bench_composent;

ARCHITECTURE bench OF bench_composant IS

component composant
   port ( a : in bit;
         b : in bit;
         c : in bit;
	      x, y : out bit);
   end composant;

 signal as, bs, cs, xs, ys : bit :='0';

begin

 c1 : composant port map (as, bs, cs, xs, ys);

process
	begin
			as <='0';
		   bs <='0';
		   cs <='0';
			WAIT FOR 10 ns;
			
			as <='0';
		   bs <='1';
		   cs <='0';
			WAIT FOR 10 ns;
			
			as <='1';
		   bs <='1';
		   cs <='0';
			WAIT FOR 10 ns;
			
			as <='1';
		   bs <='1';
		   cs <='1';
			WAIT FOR 10 ns;
			
	wait;
end process;

end bench;

configuration composent_cfg of bench_composent is

	for bench
		for c1 :composent
			use entity work.composent(comportementale);
		end for;
	end for;

end composent_cfg;
