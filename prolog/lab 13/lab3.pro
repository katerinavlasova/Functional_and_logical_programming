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
	find_by_phone_number_car(SURNAME, PHONE, MARKA, PRICE)
	find_by_phone_number_mark(PHONE, MARKA)
clauses
        info("Petrov", "88885353535", address("Moscow", "Saykin street", 10, 143)). %PERSON 1
        info("Ivanov", "81111111111", address("Kursk", "Non street", 1, 10)). %PERSON 2
        info("Krot", "89995353566", address("Moscow", "Nwot street", 5, 60)). %PERSON 3
        info("Petrov", "88005353535", address("Kursk", "Greds street", 6, 45)). %PERSON 4
        info("Petrova", "988005353535", address("Kursk", "Greds street", 6, 45)).
        
	cars("Petrov", "Moscow", "TOYOTA", "RED", 256000). %PERSON 1
	cars("Petrov", "Moscow", "BMW", "BLACK", 356000). %PERSON 1
	
	cars("Ivanov", "Kursk", "LADA", "GREEN", 100000). %PERSON 2
	
	cars("Krot", "Moscow", "Merc", "BLUE", 100000). %PERSON 3
	
	cars("Petrov", "Kursk", "Audio", "WHITE", 456000). %PERSON 4
	cars("Petrov", "Kursk", "LADA", "RED", 156000). %PERSON 4
	
	banks("Petrov", "Moscow", "Sberbank", 356, 50000). %PERSON 1
	banks("Ivanov", "Kursk", "Tinkoff", 357, 9000). %PERSON 2
	banks("Krot", "Moscow", "Rocket-bank", 20, 2000).  %PERSON 3
	banks("Petrov", "Kursk", "NEW-BANK", 333, 50000). %PERSON 4
	banks("Petrov", "Kursk", "OLD-BANK", 555, 30000). %PERSON 4
	
	find_by_phone_number_car(SURNAME, PHONE, MARKA, PRICE):- info(SURNAME, PHONE, address(CITY, _, _, _)), cars(SURNAME, CITY, MARKA, _, PRICE).
	%write("surname and city, marka and price: ", SURNAME," ", CITY, " ", MARKA, " ", PRICE), nl, fail .
	
	find_by_phone_number_mark(PHONE, MARKA):- find_by_phone_number_car(_, PHONE, MARKA, _).
	%write("surname and car`s mark: ", SURNAME," ", MARKA), nl, fail .
goal
  %find_by_phone_number_car(SURNAME, "88885353535", MARKA, PRICE).
  %find_by_phone_number_mark("81111111111", MARKA).
  SURNAME = "Petrov", CITY = "Kursk",
  info(SURNAME, PHONE, address(CITY, STREET, _, _)), banks(SURNAME, CITY, BANK, _, _).
