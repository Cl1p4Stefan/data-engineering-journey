# Northwind – schema

## Întrebări și răspunsuri (17 oct 2026)

**1. Prin ce coloană știe o comandă ce client a făcut-o?**
orders.customer_id → customers.customer_id

**2. Prin ce coloană știe ce angajat a procesat comanda?**
orders.employee_id → employees.employee_id

**3. Ce coloană arată firma de curierat?**
orders.ship_via → shippers.shipper_id
(ship_via = ID-ul curierului, nu un oraș; ship_name = numele destinatarului, nu e cheie străină)

**4. Unde sunt produsele unei comenzi și de ce stau separat?**
În order_details, un rând per (order_id, product_id).
O comandă are mai multe produse și un produs apare în multe comenzi →
relație many-to-many → e nevoie de un tabel de legătură.
unit_price e salvat aici ca să păstreze prețul de la momentul vânzării.

**5. Cu ce tabele e legat products?**
categories, suppliers și order_details (prin care ajunge la orders).

## Cum citesc ER diagram (DBeaver)
- Linie = cheie străină → cheie primară
- Bulina plină = partea „mulți” (tabelul cu cheia străină)
- Romb gol = partea „unu”, legătură opțională (FK poate fi NULL)
- Linie continuă = FK obligatoriu; punctată = opțional
- employees.reports_to → employees.employee_id = ierarhia angajat → șef (self-reference)

## Regulă
O coloană e cheie străină doar dacă pleacă o linie din ea în diagramă.