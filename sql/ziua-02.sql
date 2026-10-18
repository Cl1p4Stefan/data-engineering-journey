-- 1. Afișează numele companiei, persoana de contact, orașul și țara pentru toți clienții (customers).
select company_name, contact_name, city, country
from customers;

-- 2. Afișează numele companiei și orașul pentru clienții din Germania.
select company_name, city
from customers
where country = 'Germany';

-- 3. Afișează numele și prețul unitar pentru produsele care costă peste 50. Ordonează-le de la cel mai scump la cel mai ieftin.
select product_name, unit_price
from products
where unit_price > 50
order by unit_price desc;

-- 4. Afișează doar primele 5 produse după preț, cu numele și prețul.
select product_name, unit_price 
from products
order by unit_price desc 
limit 5;

-- 5. Vechimea angajaților. Afișează prenumele, numele, funcția și data angajării pentru toți angajații. Primul apare cel angajat cel mai demult.
select first_name, last_name, title, hire_date
from employees
order by hire_date asc;

/* 6. Clienți din Franța sau Spania. Afișează numele companiei, țara și orașul. 
Ordonează după țară, apoi după oraș alfabetic. 
Încearcă să scrii condiția fără să repeți country = ... de două ori.
*/
select company_name, country, city
from customers 
where country in ('France', 'Spain')
order by country asc, city asc;

/* 7. Comenzi din primul trimestru din 1997. 
 * Afișează ID-ul comenzii, ID-ul clientului și data comenzii pentru comenzile plasate între 1 ianuarie și 31 martie 1997 
 * în ordine cronologică. 
 * Verifică dacă intră în rezultat comenzile din 31 martie.
 */
select order_id, customer_id, order_date
from orders
where order_date between '1997-01-01' and '1997-03-31'
order by order_date asc;

/*
8. Produse de recomandat. 
Afișează numele produsului, stocul și nivelul de recomandă (reorder_level) pentru produsele care se vând încă (nu sunt discontinued) și au stocul sub nivelul de recomandă. 
Mai întâi verifică ce tip de date are coloana discontinued în varianta ta de Northwind.
*/
select product_name, units_in_stock, reorder_level
from products
where discontinued = 0 
and units_in_stock < reorder_level
order by units_in_stock;

/*
9. Manageri fără regiune. 
Afișează numele companiei, contactul, funcția contactului și țara pentru clienții care nu au regiune completată
 și a căror persoană de contact are „Manager” undeva în funcție. 
Ai grijă cum testezi o valoare lipsă.
*/
select company_name, contact_name, contact_title, country
from customers
where region is null 
and contact_title like '%Manager%'
order by company_name;

/*
10. Cele mai scumpe livrări în SUA. 
Ia comenzile livrate în USA care au fost deja expediate. 
Afișează ID-ul comenzii, data comenzii, data expedierii, costul transportului (freight) 
și o coloană calculată numită zile_pana_la_expediere. 
Păstrează doar primele 10 comenzi, ordonate după freight descrescător.
*/
select order_id, order_date, shipped_date, freight, (shipped_date - order_date) as zile_pana_la_expediere
from orders
where ship_country = 'USA' 
	and shipped_date is not null
order by freight desc
limit 10;