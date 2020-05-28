/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB3
 FileName: LAB3.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab3.inc"

domains
	home = address(CITY, STREET, HOUSE, FLAT)
	%spravochnik
	SURNAME = string
	PHONE = string 
	CITY, STREET = string
	HOUSE, FLAT = integer
	%cars
	MARKA, COLOR = string
	PRICE = integer
	%bank
	BANK = string
	NUMBER, MONEY = integer
predicates
	info(SURNAME, PHONE, home)
	cars(SURNAME, CITY, MARKA, COLOR, PRICE)
	banks(SURNAME, CITY, BANK, NUMBER, MONEY)

	find_by_car(SURNAME, CITY, PHONE, MARKA, COLOR, BANK)
clauses
        info("Petrov", "88885353535", address("Moscow", "Saykin street", 10, 143)). %PERSON 1
        info("Petrov", "81111111111", address("Kursk", "Non street", 1, 10)). %PERSON 2
        info("Krot", "89995353566", address("Moscow", "Nwot street", 5, 60)). %PERSON 3
        %2 owners
	cars("Petrov", "Moscow", "TOYOTA", "RED", 256000). %PERSON 1
	cars("Krot", "Moscow", "TOYOTA", "RED", 256000). %PERSON 3
	%1 owner
	cars("Petrov", "Kursk", "LADA", "GREEN", 100000). %PERSON 2
	%0 owners
	cars("Krotova", "Moscow", "Merc", "BLUE", 100000). 
	
	banks("Petrov", "Moscow", "Sberbank", 356, 50000). %PERSON 1
	banks("Petrov", "Kursk", "Tinkoff", 357, 9000). %PERSON 2
	banks("Krot", "Moscow", "Rocket-bank", 20, 2000).  %PERSON 3
	
	find_by_car(SURNAME, CITY, PHONE, MARKA, COLOR, BANK):- info(SURNAME, PHONE, address(CITY, _, _, _)), cars(SURNAME, CITY, MARKA, COLOR, _), banks(SURNAME, CITY, BANK, _, _).
goal
   find_by_car(SURNAME, CITY, PHONE, "TOYOTA", "RED", BANK).

