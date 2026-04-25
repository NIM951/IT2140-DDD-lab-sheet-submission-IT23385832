SELECT * 
FROM Movie

SELECT * 
FROM MovieStar

SELECT * 
FROM StarsIn

SELECT * 
FROM Theater

SELECT * 
FROM Show

SELECT * 
FROM Booking

--a
CREATE VIEW showMovieTheaterCount1 AS
SELECT m.title,m.year,m.DirectorName,COUNT(s.theaterName) AS theaterCount
FROM Movie m,Show s
WHERE m.title = s.movieTitle
GROUP BY m.title,m.year,m.DirectorName

SELECT *
FROM showMovieTheaterCount1



--b
CREATE VIEW TheaterMovieCount AS
SELECT t.theaterName,t.city,COUNT(s.movieTitle) AS movieCount
FROM Theater t, Show s
WHERE t.theaterName = s.theaterName
GROUP BY t.theaterName,t.city

SELECT *
FROM TheaterMovieCount 



--c
CREATE FUNCTION GetMovieCountByStar(@starName CHAR(25))
RETURNS INT
AS
BEGIN
	DECLARE @movieCount INT
	SELECT @movieCount = COUNT(movieTitle)
	FROM StarsIn
	WHERE starname = @starName
	RETURN @movieCount
END;



--d
CREATE FUNCTION GetTotalSpectatorsByTheater(@theaterName VARCHAR(20))
RETURNS INT
AS
BEGIN
	DECLARE @totalSpectators INT
	SELECT @totalSpectators = SUM(spectators)
	FROM Show
	WHERE theaterName = @theaterName
	RETURN ISNULL(@totalSpectators,0)
END;