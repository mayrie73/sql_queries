/* 1. Who are the top 5 customers based on total sales per customer? */

SELECT
    C.FirstName,
    C.LastName,
    SUM(I.Total) Total_Sales
FROM
    Customer C
    JOIN Invoice I ON C.CustomerId = I.CustomerId
GROUP BY
    1,
    2
ORDER BY
    3 DESC
LIMIT
    5;

/* 2. Which countries have the highest rock music sales? */

SELECT
    I.BillingCountry Country,
    Sum(IL.UnitPrice * IL.Quantity) Total_Sales_Rock
FROM
    Invoice I
    JOIN InvoiceLine IL ON I.InvoiceId = IL.InvoiceId
    JOIN Track T ON T.TrackId = IL.TrackId
    JOIN Genre G ON G.GenreId = T.GenreId
WHERE
    G.Name = 'Rock'
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    5;

/* 3. Which reggae artist earned the most based on reggae music sales? */

SELECT
    A.Name Name,
    G.Name Genre,
    Sum(IL.UnitPrice * IL.Quantity) Total_Sales_Reggae
FROM
    Artist A
    JOIN Album AL ON A.ArtistId = AL.ArtistId
    JOIN Track T ON T.AlbumId = AL.AlbumId
    JOIN Genre G ON G.GenreId = T.GenreId
    JOIN InvoiceLine IL ON IL.TrackId = T.TrackId
WHERE
    G.Name = 'Reggae'
GROUP BY
    1
ORDER BY
    3 DESC;

/* 4. Which sales support agent supported the most customers? */

SELECT
    E.FirstName,
    E.LastName,
    Count(*) Num_Customers_Supported
FROM
    Customer C
    JOIN Employee E ON C.SupportRepId = E.EmployeeId
WHERE
    E.Title = 'Sales Support Agent'
GROUP BY
    1,
    2
ORDER BY
    3 DESC;

