/*
Table: Followers
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
(user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.
Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.
The result format is in the following example.
*/
SELECT user_id,
       (SELECT COUNT(*) FROM Followers AS f2 WHERE f2.user_id = f1.user_id) AS followers_count
FROM (SELECT DISTINCT user_id FROM Followers) AS f1
ORDER BY user_id;