/* 1. Țări cu clienți.
Afișează lista țărilor în care Northwind are clienți, fiecare țară o singură dată, în ordine alfabetică.
Verificare: câte rânduri obții cu DISTINCT și câte fără?
*/
select distinct country
from customers 
order by country;
--Raspuns: 21 cu distinct, 91 fara

/* 2. Perechi țară–oraș.
Afișează combinațiile unice de țară și oraș pentru clienți, ordonate după țară, apoi după oraș.
Întrebare: de ce obții mai multe rânduri decât la exercițiul 1? Ce anume face DISTINCT „unic”?
*/
select distinct country, city 
from customers
order by country, city;
--Raspuns: unei tari ii pot fi atribuite mai multe orase unice
-- distinct verifica sa nu fie dubluri la coloanele din select, pornind de la ultima coloana din select (acelasi country sa nu aiba acelasi oras dublura)

/* 3. Paginare.
Afișează ID-ul, numele și prețul produselor în ordine alfabetică după nume, câte 10 pe pagină.
Vreau pagina 3 (adică rândurile 21–30).
Întrebare: scrie ca formulă ce valoare are OFFSET pentru pagina n, cu k rânduri pe pagină.
*/
select product_id, product_name, unit_price
from products
order by product_name 
limit 10 offset 20;
-- offset = k * (n-1)


/* 4. Clienți din alte țări.
Afișează numele companiei, orașul și țara pentru clienții care NU sunt din USA, Germany, France, Brazil sau UK.
Ordonează după țară. Scrie condiția fără să repeți country <> ... de cinci ori.
*/
select company_name, city, country
from customers
where country not in ('USA', 'Germany', 'France', 'Brazil', 'UK')
order by country;

/* 5. Ambalaje.
Afișează numele produsului și ambalajul (quantity_per_unit) pentru produsele care se vând încă
și al căror ambalaj nu conține nici „bottles”, nici „jars”.
Mai întâi uită-te prin coloana quantity_per_unit: cum sunt scrise cuvintele (litere mari sau mici)?
*/
select product_name, quantity_per_unit
from products
where discontinued = 0 
	and quantity_per_unit not like '%bottles%' 
	and quantity_per_unit not like '%jars%';
--Raspuns: doar cu litere mici, altfel as fi folosit ilike

/* 6. Apostroful.
Afișează numele și prețul tuturor produselor al căror nume conține un apostrof (ex. un nume cu ’s).
Problemă de rezolvat: cum scrii un apostrof în interiorul unui text delimitat de ghilimele simple?
*/
select product_name, unit_price
from products
where product_name like '%''%';

/* 7. Comenzile din februarie 1997.
Afișează ID-ul comenzii, ID-ul clientului și data comenzii pentru comenzile din februarie 1997, cronologic.
Regulă: nu ai voie să scrii ultima zi a lunii februarie în interogare.
*/
select order_id, customer_id, order_date
from orders
where order_date < '1997-03-01' 
	and order_date >= '1997-02-01'
order by order_date;

/* 8. Paranteze.
Afișează numele, categoria (category_id) și prețul produselor din categoria 1 sau 2 care costă peste 20.
Rulează interogarea cu paranteze și apoi fără ele. Notează în comentariu câte rânduri dă fiecare
și explică, într-o propoziție, ce condiție a evaluat PostgreSQL în varianta fără paranteze.
*/
select product_name, category_id, unit_price
from products
where category_id in (1, 2)
	and unit_price > 20;

select product_name, category_id, unit_price
from products
where category_id = 1 
	or category_id = 2
	and unit_price > 20;

select product_name, category_id, unit_price
from products
where (category_id = 1 
	or category_id = 2)
	and unit_price > 20;
--Raspuns: 19 fara paranteze, 9 cu paranteze

/* 9. Șefii angajaților.
Afișează prenumele, numele, funcția și reports_to pentru angajații al căror șef NU este angajatul cu ID 2.
Angajații care nu au deloc șef trebuie să apară și ei în rezultat.
Scrie prima variantă cu NOT IN, rulează și verifică: apar toți angajații pe care îi așteptai?
*/
select first_name, last_name, title, reports_to
from employees
where reports_to not in (2)
	or reports_to is null;
-- Raspuns: s-a eliminat cazul cu angajatul care nu are sef (null). trebuie pus explicit si constrangerea "or reports_to is null" 
-- altfel nu va fi afisata ca orice operatie cu null e tot null. cazul not in nu afiseaza valorile null (comparatia da null si nu e afisata)

/* 10. Comenzi problematice din 1998.
Ia comenzile plasate în 1998 care fie nu au fost expediate încă, fie au fost expediate după data cerută (required_date).
Exclude comenzile trimise în USA și Canada.
Afișează ID-ul comenzii, țara de livrare, data comenzii, data cerută, data expedierii
și o coloană calculată zile_intarziere (expediere minus data cerută).
Ordonează după data comenzii și afișează pagina 2, cu câte 5 comenzi pe pagină.
Întrebare: ce valoare are zile_intarziere pentru comenzile neexpediate și de ce?
*/
select order_id, ship_country, order_date, required_date, shipped_date, (shipped_date  - required_date) as zile_intarziere
from orders
where order_date >= '1998-01-01' 
	and order_date  < '1999-01-01'
	and ship_country not in ('USA', 'Canada')
	and ((shipped_date - required_date) > 0
	or shipped_date is null)
order by order_date 
limit 5 offset 5;
-- Raspuns: null deoarece orice operatie cu null da null