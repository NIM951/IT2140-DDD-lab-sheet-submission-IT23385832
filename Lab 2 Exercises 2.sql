SELECT *
FROM emp

SELECT * 
FROM works

SELECT * 
FROM dept

SELECT did, COUNT(eid) as NumOfEmp
FROM works
GROUP BY did;

SELECT d.did,COUNT(w.eid) AS NumOfEmp
FROM works w,dept d
WHERE w.did= d.did
GROUP BY d.did;

SELECT did
FROM works
GROUP BY did
HAVING COUNT(eid)>2;

SELECT d.did,COUNT(w.eid) AS NumOfEmp
FROM works w,dept d
WHERE w.did = d.did
GROUP BY d.did
HAVING COUNT(w.eid)>2
ORDER BY NumOfEmp ASC;