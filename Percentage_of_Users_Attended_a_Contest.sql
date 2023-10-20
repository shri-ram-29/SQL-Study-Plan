/*
Table: Users
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key (column with unique values) for this table.
Each row of this table contains the name and the id of a user.
 
Table: Register
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+
(contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id of a user and the contest they registered into.
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
The result format is in the following example.
*/
WITH ContestUserCounts AS (
    SELECT
        r.contest_id,
        COUNT(DISTINCT r.user_id) AS user_count
    FROM
        Register r
    GROUP BY
        r.contest_id
),
TotalUsers AS (
    SELECT
        COUNT(DISTINCT user_id) AS total_users
    FROM
        Users
)
SELECT
    c.contest_id,
    ROUND((c.user_count / t.total_users) * 100, 2) AS percentage
FROM
    ContestUserCounts c
JOIN
    TotalUsers t
ON
    1=1
ORDER BY
    percentage DESC,
    contest_id;