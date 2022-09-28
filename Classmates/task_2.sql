-- CREATE DATABASE test_1;

-- USE test_1;

-- CREATE TABLE Purchases (user_id INT, 
-- user_gender VARCHAR(10), items INT, price INT);
-- INSERT INTO Purchases(user_id, user_gender, items, price) 
-- VALUES 
-- (101, 'f', 3, 100), 
-- (102, 'female', 0, 0), 
-- (103, 'm', 0, 0),
-- (101, 'f', 2, 100),
-- (105, 'male', 2, 100),
-- (103, 'm', 0, 0);

-- SELECT SUM(items * price) AS revenue
-- FROM Purchases AS P
-- WHERE user_gender LIKE 'f%';

-- SELECT MAX(user_gender) AS gender, 
-- SUM(items * price) AS revenue
-- FROM Purchases
-- GROUP BY 
-- CASE
--     WHEN user_gender LIKE 'f%' THEN 'f'
--     WHEN user_gender LIKE 'm%' THEN 'm'
-- END; COALESCE(COUNT(DISTINCT user_id), 0) AS count


SELECT 
CASE WHEN EXISTS(
    SELECT COUNT(DISTINCT user_id) AS count
    FROM Purchases
    WHERE user_gender LIKE 'm%'
    GROUP BY user_id
    HAVING SUM(items) > 3)
THEN 
    (SELECT COUNT(DISTINCT user_id) AS count
    FROM Purchases
    WHERE user_gender LIKE 'm%'
    GROUP BY user_id
    HAVING SUM(items) > 3)
ELSE 0 END AS count;

-- INSERT INTO Purchases(user_id, user_gender, items, price) 
-- VALUES 
-- (110, 'm', 3, 100), 
-- (112, 'm', 1, 10), 
-- (112, 'm', 1, 20),
-- (112, 'm', 2, 100);
