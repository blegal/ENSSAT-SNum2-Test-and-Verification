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
use IEEE.numeric_std.all;

entity PGCD is
    Port ( 
           CLK      : in  STD_LOGIC;
           RESET    : in  STD_LOGIC;

           idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
           idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
           idata_en : in  STD_LOGIC;

           odata    : out STD_LOGIC_VECTOR (31 downto 0);
           odata_en : out STD_LOGIC
	);
end PGCD;

ARCHITECTURE Behavioral of PGCD IS


END Behavioral;
