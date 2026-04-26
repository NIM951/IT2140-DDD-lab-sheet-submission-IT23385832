--(1)
--c)
	SELECT did
    FROM dept
    WHERE budget > (
    SELECT AVG(salary)
    FROM emp);

--d)
	SELECT eid, ename, salary
    FROM emp
    WHERE salary <> (
    SELECT AVG(salary)
    FROM emp);

--e)
SELECT eid, ename, salary
FROM emp
Where salary < (
    SELECT salary
    FROM emp
    WHERE eid = (
        SELECT managerId
        FROM dept
        WHERE did = 'ITSD' )
);

--(2)
--c)
 SELECT eid, ename, salary
FROM emp
WHERE salary > ALL (
    SELECT salary
    FROM emp , dept
    WHERE did = (
        SELECT did
        FROM dept
        WHERE did = 'Admin')
);

--d) 
SELECT eid, ename, salary
FROM emp
WHERE salary > ANY (
    SELECT salary
    FROM emp,dept
    WHERE did = (
        SELECT did
        FROM dept
        WHERE did = 'Finance')
);

--e)
SELECT did
FROM dept
WHERE did NOT IN (
    SELECT did
    FROM emp
    WHERE salary < 30000
);






