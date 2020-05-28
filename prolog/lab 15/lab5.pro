/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB5
 FileName: LAB5.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab5.inc"

domains
	home = address(CITY, STREET, HOUSE, FLAT)
	SURNAME, PHONE,CITY, STREET,MARKA,COLOR,BANK, TYPE=string
	HOUSE, FLAT, PRICE, NUMBER, MONEY, LENGHT, TOTAL = integer
	ownership = cars(MARKA, COLOR, PRICE);
		           ground(PRICE, LENGHT);
		           house(PRICE, STREET);
		           water_trasport(MARKA, PRICE)
predicates
	info(SURNAME, PHONE, home)
	banks(SURNAME, CITY, BANK, NUMBER, MONEY)
	own(SURNAME, CITY, ownership, TYPE)
	owns(SURNAME, TYPE)
	ownsPrice(SURNAME, PRICE, TYPE)
	ownsSumm(SURNAME, PRICE, TYPE)
	full_price(SURNAME, TOTAL)
clauses
        info("Petrov", "88885353535", address("Moscow", "Saykin street", 10, 143)). %PERSON 1
        info("Ivanov", "81111111111", address("Kursk", "Non street", 1, 10)). %PERSON 2
        info("Krot", "89995353566", address("Moscow", "Nwot street", 5, 60)). %PERSON 3
	banks("Petrov", "Moscow", "Sberbank", 356, 50000). %PERSON 1
	banks("Ivanov", "Kursk", "Tinkoff", 357, 9000). %PERSON 2
	banks("Krot", "Moscow", "Rocket-bank", 20, 2000).  %PERSON 3
	

	own("Petrov", "Moscow", cars("LADA", "RED", 23432), "cars").
	own("Petrov", "Moscow", ground(234320, 200), "ground").
	own("Petrov", "Moscow", house(99990, "Street1"), "house").
	own("Petrov", "Moscow", water_trasport("Wasser1", 9000), "water_transport").
	
	own("Ivanov", "Kursk", cars("MERC", "BLUE", 99999), "cars").
	own("Ivanov", "Kursk", ground(24320, 100), "ground").
	own("Krot", "Moscow", water_trasport("Wasser2", 1000), "water_transport").

	%1 задание - по имени человека найти собственность
	owns(SURNAME, TYPE):- own(SURNAME, _, cars(_, _, _), TYPE). 
	owns(SURNAME, TYPE):- own(SURNAME, _, ground(_, _), TYPE). 
	owns(SURNAME, TYPE):- own(SURNAME, _, house(_, _), TYPE).
	owns(SURNAME, TYPE):- own(SURNAME, _, water_trasport(_, _), TYPE).

	%2 задание - по имени человека вывести всю собственность и цену
	ownsPrice(SURNAME, PRICE, TYPE):- own(SURNAME, _, cars(_, _, PRICE), TYPE).
	ownsPrice(SURNAME, PRICE, TYPE):- own(SURNAME, _, ground(PRICE, _), TYPE).
	ownsPrice(SURNAME, PRICE, TYPE):- own(SURNAME, _, house(PRICE, _), TYPE).
	ownsPrice(SURNAME, PRICE, TYPE):- own(SURNAME, _, water_trasport(_, PRICE), TYPE).

	ownsSumm(SURNAME, PRICE, TYPE):- own(SURNAME, _, cars(_, _, PRICE), TYPE). 
	ownsSumm(SURNAME, PRICE, TYPE):- own(SURNAME, _, ground(PRICE, _), TYPE). 
	ownsSumm(SURNAME, PRICE, TYPE):- own(SURNAME, _,  house(PRICE, _), TYPE). 
	ownsSumm(SURNAME, PRICE, TYPE):- own(SURNAME, _, water_trasport(_, PRICE), TYPE). 
	
	%3 задание. Правило, позволяющее найти суммарную стоимость всех объектов собственности  заданного субъекта
	full_price(SURNAME, TOTAL):-
	ownsSumm(SURNAME, PRICE1, "cars"),
	ownsSumm(SURNAME, PRICE2, "ground"),
	ownsSumm(SURNAME, PRICE3, "house"),
	ownsSumm(SURNAME, PRICE4, "water_transport"),
	TOTAL = PRICE1 + PRICE2 + PRICE3 + PRICE4.
goal
ownsPrice("Petrov", PRICE, TYPE).
