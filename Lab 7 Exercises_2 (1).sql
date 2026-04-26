-- Lab 7
-- Exercise 2

-- a. Add rank column to MovieStar table
ALTER TABLE MovieStar
ADD rank INT DEFAULT 0;
GO

-- Create procedure to update rank based on number of lead roles
CREATE PROCEDURE UpdateMovieRank
AS
BEGIN
    -- Update the rank for each movie star based on the number of lead roles
    UPDATE ms
    SET ms.rank = ISNULL(leadRoles.leadCount, 0)
    FROM MovieStar ms
    LEFT JOIN (
        SELECT starname, COUNT(*) AS leadCount
        FROM StarsIn
        WHERE LTRIM(RTRIM(LOWER(role))) = 'lead'
        GROUP BY starname
    ) AS leadRoles
    ON LTRIM(RTRIM(ms.name)) = LTRIM(RTRIM(leadRoles.starname));
END;
GO

-- b. Trigger to update rank when a new lead role is inserted
CREATE TRIGGER trg_UpdateRankOnNewMovie
ON StarsIn
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Increment rank for newly inserted lead roles
    UPDATE ms
    SET ms.rank = ISNULL(ms.rank, 0) + 1
    FROM MovieStar ms
    INNER JOIN inserted i
        ON LTRIM(RTRIM(ms.name)) = LTRIM(RTRIM(i.starname))
    WHERE LTRIM(RTRIM(LOWER(i.role))) = 'lead';
END;
GO
