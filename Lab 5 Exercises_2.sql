SELECT si.starname
FROM StarsIn si, Movie m
WHERE si.movieTitle = m.title AND si.movieYear = m.year AND m.directorName = 'Jon Watts';

SELECT m.title AS movieTitle, SUM(sh.spectators) AS totalSpectators
FROM Show sh, Movie m, Theater t
WHERE sh.movieTitle = m.title AND sh.theaterName = t.theaterName AND t.city = 'LA'
GROUP BY m.title;

SELECT b.custName
FROM Booking b, Show sh
WHERE b.showId = sh.showId
GROUP BY b.custName
HAVING COUNT(DISTINCT sh.movieTitle) > 1;

SELECT t.theaterName, SUM(sh.ticketPrice * sh.spectators) AS totalIncome
FROM Show sh, Theater t
WHERE sh.theaterName = t.theaterName
GROUP BY t.theaterName
HAVING SUM(sh.ticketPrice * sh.spectators) > 50000;

SELECT b.custName
FROM Booking b, Show sh
WHERE b.showId = sh.showId
GROUP BY b.custName
HAVING COUNT(DISTINCT sh.theaterName) > 1;
