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
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

entity compteur is
   port ( reset : in Std_Logic;
         clk   : in Std_Logic;
         up : in Std_Logic;
	      output : out Std_Logic_vector(3 downto 0 ));
   end compteur;

architecture comportementale of compteur is
	signal count : Std_Logic_vector(3 downto 0 );
begin
   synchrone : process (reset,clk)
   begin
     if reset='0' then
        count<=(others=>'0');
     elsif clk'event and clk='1' then
         case up is
             when '1' => count <= count + 1;
             when '0' => count <= count - 1;
             when others => null;
         end case;
     end if ;
    end process ;

    output <= count;

end comportementale;
