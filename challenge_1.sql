CREATE DATABASE Placements;
use Placements;

CREATE TABLE IF NOT EXISTS students(
    ID INT(6) UNSIGNED PRIMARY KEY,
    Name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Friends(
    ID INT(6) UNSIGNED PRIMARY KEY,
    Friend_ID INT(6) UNSIGNED
);

CREATE TABLE IF NOT EXISTS Packages(
    ID INT(6) UNSIGNED PRIMARY KEY,
    Salary DECIMAL(6,3) UNSIGNED
);

INSERT INTO students (ID, Name)
   VALUES ( 1, "Ashley");
INSERT INTO students (ID, Name)
   VALUES ( 2, "Samantha");
INSERT INTO students (ID, Name)
   VALUES ( 3, "Julia");
INSERT INTO students (ID, Name)
   VALUES ( 4, "Scarlet");

INSERT INTO Friends (ID, Friend_ID)
   VALUES ( 1, 2);
INSERT INTO Friends (ID, Friend_ID)
   VALUES ( 2, 3);
INSERT INTO Friends (ID, Friend_ID)
   VALUES ( 3, 4);
INSERT INTO Friends (ID, Friend_ID)
   VALUES ( 4, 1);

INSERT INTO Packages (ID, Salary)
   VALUES ( 1, 15.20);
INSERT INTO Packages (ID, Salary)
   VALUES ( 2, 10.06);
INSERT INTO Packages (ID, Salary)
   VALUES ( 3, 11.55);
INSERT INTO Packages (ID, Salary)
   VALUES ( 4, 12.12);


SELECT f.ID, p.Salary, f.Friend_ID, fp.Salary as friend_salary, s.Name
FROM Friends as f
INNER JOIN Packages as p ON f.ID=p.ID
INNER JOIN Packages as fp ON f.Friend_ID=fp.ID
INNER JOIN students as s ON s.ID=f.ID
WHERE fp.Salary > p.Salary
ORDER BY fp.Salary;


SELECT s.Name
FROM Friends as f
INNER JOIN Packages as p ON f.ID=p.ID
INNER JOIN Packages as fp ON f.Friend_ID=fp.ID
INNER JOIN students as s ON s.ID=f.ID
WHERE fp.Salary > p.Salary
ORDER BY fp.Salary;