WITH QueryQuality AS (
    SELECT query_name, AVG(CAST(rating AS DECIMAL) / position) AS quality
    FROM Queries
    GROUP BY query_name
),
PoorQueryPercentage AS (
    SELECT query_name,
        (SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS poor_query_percentage
    FROM Queries
    GROUP BY query_name
)
SELECT
    Q.query_name,
    ROUND(Q.quality, 2) AS quality,
    ROUND(P.poor_query_percentage, 2) AS poor_query_percentage
FROM QueryQuality Q
JOIN PoorQueryPercentage P
ON Q.query_name = P.query_name;