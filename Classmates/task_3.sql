-- CREATE DATABASE test_1;

-- USE test_1;

-- CREATE TABLE Transactions (transaction_ts DATETIME, 
-- user_id BIGINT, transaction_id BIGINT, item VARCHAR(20));
-- INSERT INTO Transactions(transaction_ts, user_id, transaction_id, item) 
-- VALUES 
-- ('2016-06-18T13:46:51.000', 13811335, 1322361417, 'glove'), 
-- ('2016-06-18T17:29:25.000', 13811335, 3729362318, 'hat'), 
-- ('2016-06-18T23:07:12.000', 13811335, 1322363995, 'vase'), 
-- ('2016-06-19T07:14:56.000', 13811335, 7482365143, 'cup'), 
-- ('2016-06-19T21:59:40.000', 13811335, 1322369619, 'mirror'), 
-- ('2016-06-17T12:39:46.000', 3378024101, 9322351612, 'dress'), 
-- ('2016-06-17T20:22:17.000', 3378024101, 9322353031, 'vase'), 
-- ('2016-06-20T11:29:02.000', 3378024101, 6928364072, 'tie'), 
-- ('2016-06-20T18:59:48.000', 13811335, 1322375547, 'mirror');

-- SELECT user_id, item
-- FROM (
--     ((SELECT user_id, MIN(transaction_ts) AS min_ts
--     FROM Transactions AS T
--     GROUP BY user_id) AS tmp_tb)
--     INNER JOIN Transactions AS T
--      ON T.transaction_ts = tmp_tb.min_ts
--      AND T.user_id = tmp_tb.user_id))
-- WHERE transaction_ts = min_ts AND user_id = tmp_tb.user_id;

-- WITH tmp_tb AS (SELECT user_id,
--         MIN(transaction_ts) AS min_ts
--         FROM Transactions AS T
--         GROUP BY user_id)
-- SELECT tmp_tb.user_id, T.item FROM tmp_tb
-- INNER JOIN Transactions AS T
-- ON T.transaction_ts = tmp_tb.min_ts
-- AND T.user_id = tmp_tb.user_id;

-- INSERT INTO Transactions(transaction_ts, user_id, transaction_id, item) 
-- VALUES 
-- ('2016-06-25T13:46:51.000', 13811335, 1322361417, 'glove');

WITH tmp_tb AS (SELECT user_id,
        MIN(transaction_ts) AS min_ts
        FROM Transactions AS T
        GROUP BY user_id)
SELECT CAST(COUNT(T.user_id) AS FLOAT) / COUNT(DISTINCT T.user_id) AS avg
FROM Transactions AS T
INNER JOIN tmp_tb 
ON T.user_id = tmp_tb.user_id
WHERE T.transaction_ts <= DATEADD(DAY, 3, tmp_tb.min_ts);
