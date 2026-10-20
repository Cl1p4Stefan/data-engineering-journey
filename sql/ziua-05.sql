/* 1. Produse și categorii.
Afișează numele produsului, numele categoriei și prețul pentru toate produsele.
Ordonează după numele categoriei, apoi după numele produsului.
Întrebare: prin ce coloană sunt legate cele două tabele? (Verifică în diagrama ER.)
*/


/* 2. Comenzile din martie 1998.
Pentru comenzile plasate în martie 1998, afișează ID-ul comenzii, data comenzii,
numele companiei clientului și prenumele + numele angajatului care a procesat comanda.
Ai nevoie de trei tabele. Ordonează cronologic.
Regula de la ziua 4 rămâne: fără ultima zi a lunii în interogare.
*/


/* 3. Clienți fără comenzi.
Afișează ID-ul și numele companiei pentru clienții care nu au plasat nicio comandă.
Întrebare 1: de ce nu poți găsi acești clienți cu INNER JOIN?
Întrebare 2: pe ce coloană testezi lipsa comenzii și de ce contează care coloană alegi?
*/


/* 4. Clienți pe țară.
Afișează fiecare țară și numărul de clienți din ea, de la țara cu cei mai mulți clienți la cea cu cei mai puțini.
Verificare: suma tuturor numerelor trebuie să fie egală cu ce?
*/


/* 5. COUNT(*) vs COUNT(coloană).
Pentru fiecare țară, afișează numărul total de clienți și, într-o a doua coloană,
câți dintre ei au regiunea completată. Ordonează după țară.
Întrebare: de ce diferă cele două numere pentru unele țări? Ce numără fiecare formă?
*/


/* 6. Valoarea comenzilor.
Din order_details, calculează valoarea totală a fiecărei comenzi: preț × cantitate, cu discountul aplicat.
Afișează ID-ul comenzii și valoarea (numită valoare_comanda), doar primele 10 comenzi, de la cea mai valoroasă.
Mai întâi uită-te la coloana discount: ce valori are și ce înseamnă 0.15?
*/


/* 7. Categorii scumpe.
Afișează numele categoriei, numărul de produse și prețul mediu, doar pentru categoriile
cu prețul mediu peste 30. Rotunjește prețul mediu la 2 zecimale.
Întrebare: de ce condiția pe prețul mediu nu poate sta în WHERE?
(Legătură cu ce ai învățat ieri despre ordinea în care se evaluează interogarea.)
*/


/* 8. Angajații din 1997.
Afișează prenumele, numele și numărul de comenzi procesate în 1997 pentru fiecare angajat,
doar pentru cei cu peste 50 de comenzi în acel an. Ordonează descrescător după numărul de comenzi.
Ai două filtre: unul pe rânduri, unul pe grupuri. Care merge unde?
*/


/* 9. Toți clienții și comenzile lor.
Afișează numele companiei și numărul de comenzi pentru FIECARE client, inclusiv cei fără nicio comandă
(trebuie să apară cu 0). Ordonează crescător după numărul de comenzi.
Verifică primele rânduri: au cei de la exercițiul 3 exact 0? Dacă nu, gândește-te ce numără COUNT.
*/


/* 10. Țări doar cu furnizori sau doar cu clienți.
Afișează țările în care Northwind are furnizori, dar nu are clienți, și țările în care are clienți, dar nu are furnizori.
Afișează două coloane: țara din suppliers și țara din customers, fiecare pereche o singură dată.
Folosește FULL JOIN direct între suppliers și customers (fără subinterogări).
Întrebare: ce înseamnă un rând unde una dintre coloane e NULL?
*/