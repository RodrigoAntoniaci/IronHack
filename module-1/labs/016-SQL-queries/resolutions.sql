SELECT *  
FROM data;

-- Question 1
SELECT DISTINCT prime_genre 
FROM data;

-- Question 2
SELECT prime_genre, SUM(rating_count_tot)
FROM data
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC
LIMIT 1;

-- Question 3
SELECT prime_genre, COUNT(id)
FROM data
GROUP BY prime_genre
ORDER BY COUNT(id) DESC
LIMIT 1;

-- Question 4
SELECT prime_genre, SUM(rating_count_tot)
FROM data
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) ASC
LIMIT 1;

-- Question 5
SELECT track_name, rating_count_tot
FROM data
ORDER BY rating_count_tot DESC
LIMIT 1;

-- Question 6
SELECT track_name, user_rating
FROM data
ORDER BY user_rating DESC
LIMIT 10;

-- Question 7
SELECT track_name, user_rating, rating_count_tot
FROM data
ORDER BY user_rating DESC
LIMIT 10;

-- Question 8




-- Question 9
SELECT track_name, user_rating, user_rating_ver
FROM data
WHERE user_rating > user_rating_ver
LIMIT 15;

-- Question 10
SELECT track_name, rating_count_tot, user_rating
FROM data
ORDER BY rating_count_tot DESC, user_rating
LIMIT 3;

-- Question 11
SELECT track_name, price, user_rating
FROM data
ORDER BY price DESC, user_rating
LIMIT 20;

SELECT track_name, rating_count_tot, user_rating, price
FROM data
ORDER BY rating_count_tot DESC, user_rating
LIMIT 10;

-- Bonus 1
SELECT COUNT(*)
FROM data
WHERE prime_genre = 'Games' 
AND
"lang.num" > 1;

-- Bonus 2
SELECT CASE WHEN price = 0 THEN 'Free' ELSE 'Paid' END AS fl_free,
	COUNT(*) AS count_apps
FROM data
GROUP BY fl_free;

-- Bonus 3
SELECT prime_genre,
	CASE WHEN price = 0 THEN 'Free' ELSE 'Paid' END AS fl_free,
	COUNT(*) AS count_apps
FROM data
GROUP BY fl_free, prime_genre
ORDER BY prime_genre, fl_free;