
/*
  1) Show all registered customers alphabetically, who have greater discount than 0
*/
SELECT DISTINCT name
FROM customer JOIN loyaltycard on customer.card = loyaltycard.id
WHERE (discount > 0)
ORDER BY name;

/*
  2) Show names of all products that was purchased by anna
*/
SELECT P.name
FROM
    product AS P
    JOIN "order" AS O on (P.id = O.product)
    JOIN loyaltycard AS C on (C.id = O.card)
    JOIN customer AS C2 on (C.id = C2.card)
WHERE (C2.name = 'Anna Urbánková')
ORDER BY name;

/*
  3) Show comprehensive information about tea products
*/
SELECT name, price, numberofinfusions, type, countryoforigin, S.supplier
FROM product NATURAL JOIN tea JOIN suppliedby as S on product.id = S.product;

/*
  4) Show all products and their attributes shown in tea list
*/
SELECT P.name, P.price, M.allergens, T.type, T.numberofinfusions, T.countryoforigin
FROM  product as P
    FULL OUTER JOIN meal as M on P.id = M.id
    FULL OUTER JOIN tea as T on P.id = T.id;

/*
  5) Show all registered customers with their corresponding total money spent
*/
SELECT C2.name, SUM(C.price) as sum
FROM
    loyaltycard as L
    FULL OUTER JOIN customer AS C2 on (L.id = C2.card)
    FULL OUTER JOIN "order" as O on (o.card = L.id)
    FULL OUTER JOIN contains as C on (C."order" = O.id)
WHERE C2.name IS NOT NULL
GROUP BY C2.name
ORDER BY sum;

/*
  6) Show names of all tea that aren't multi-infusion, except karkade (cuz everybody knows karkade is always only single infusion)
*/
SELECT P.name
FROM
    product as P
    JOIN tea as T on P.id = T.id
GROUP BY P.name, T.numberofinfusions
HAVING(T.numberofinfusions < 10)
EXCEPT
SELECT P2.name
FROM
    product as P2
WHERE(P2.name = 'Karkáde');

/*
  7) Show all registered customers who purchased something
*/
SELECT DISTINCT name, card
FROM customer
WHERE
    card in (
        SELECT DISTINCT "order".card
        FROM "order"
        WHERE (card = "order".card)
    );