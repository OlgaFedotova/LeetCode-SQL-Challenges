SELECT name AS results
FROM (
    SELECT U.name
    FROM Users AS U
    JOIN MovieRating AS MR ON U.user_id = MR.user_id
    GROUP BY U.user_id, U.name
    ORDER BY COUNT(*) DESC, U.name
    LIMIT 1
) AS MostActiveUser

UNION ALL


SELECT title
FROM (
    SELECT M.title
    FROM MovieRating AS MR
    JOIN Movies AS M ON MR.movie_id = M.movie_id
    WHERE MONTH(created_at) = 2 and year(created_at) = 2020
    GROUP BY M.title
    ORDER BY AVG(rating) DESC, M.title
    LIMIT 1
) AS TopFebMovie
