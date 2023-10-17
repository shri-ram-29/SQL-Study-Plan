/*
Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
This table contains information about the temperature on a certain day.

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
The result format is in the following example.
*/
SELECT a.id 
FROM Weather a, Weather b
WHERE DATEDIFF(a.recordDate, b.recordDate)=1 AND a.temperature>b.temperature;