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

entity composant is
  port ( a : in bit;
    b : in bit;
    c : in bit;
    x, y : out bit);
end composant;

architecture comportementale of composant is
begin

   process(a,b,c)
     variable s : bit;
   begin

       if (a='1' and b='0') then
         x <= '0';
       else
         x <= '1';
       end if;
       
       s := a xor b;
       y <= s and c;

   end process;

end comportementale;