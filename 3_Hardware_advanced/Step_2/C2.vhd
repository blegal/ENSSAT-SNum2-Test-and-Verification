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

entity C2 is
 port( A : in signed(7 downto 0);
	B 	: in signed(7 downto 0);
	Cd : in Std_Logic;	-- Signal de commande du tri-state
	Clk : in Std_Logic;	-- Signal d'horloge
	S	: out signed(15 downto 0)) ;
end C2;

architecture comportementale of C2 is
signal T0 : signed(7 downto 0);
	signal T1 : signed(7 downto 0);
	signal T3 : signed(15 downto 0);
	signal T4 : signed(15 downto 0);
	signal T5 : signed(15 downto 0);
begin
	sequentiel : process (clk)
	begin
		if clk'event and clk='1' then
			T0 <= A;
			T1 <= B;
			T3 <= T0 * T1;	-- Multiplication sign�e
			T4 <= T5;
		end if;
	end process sequentiel;
	
	T5 <= T3 + T4;	-- Addition sign�e
	
	combinatoire : process(Cd,T5)
	begin
			if Cd = '0' then
				S <= T5;
			else
				S <= (others=>'Z');
			end if;
	end process combinatoire;
end comportementale;
