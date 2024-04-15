SELECT title
FROM movies
WHERE vote_count > 100 AND title NOT LIKE '%Star%';

SELECT DISTINCT directors.name
FROM directors
JOIN movies ON directors.id = movies.director_id
WHERE movies.revenue > 1000000 AND movies.vote_average > 7;

SELECT name
FROM directors
WHERE name LIKE '%Peter%';

SELECT *
FROM movies
WHERE strftime('%Y', release_date) = '2000';

SELECT name
FROM directors
WHERE uid BETWEEN 500 AND 5500;

SELECT title
FROM movies
WHERE vote_average > 7
AND vote_count BETWEEN 100 AND 500;

SELECT DISTINCT directors.name
FROM directors
JOIN movies ON directors.id = movies.director_id
WHERE movies.revenue > 1000000 AND movies.popularity < 5;

SELECT SUM(revenue) AS total_revenue
FROM movies
WHERE director_id IN (
    SELECT id
    FROM directors
    WHERE name LIKE '%Christopher Nolan%'
);

SELECT title, release_date
FROM movies
WHERE vote_average IS NULL;

SELECT title
FROM movies
WHERE (budget IS NULL OR revenue IS NULL) AND vote_count > 10;

SELECT movies.title
FROM movies
JOIN directors ON movies.director_id = directors.id
WHERE movies.vote_average BETWEEN 6 AND 8
AND directors.name LIKE 'S%'

SELECT directors.name, COUNT(*) AS num_movies
FROM directors
JOIN movies ON directors.id = movies.director_id
WHERE movies.revenue > 100000 AND movies.popularity < 10
GROUP BY directors.name;

SELECT name
FROM directors
WHERE id NOT IN (
    SELECT DISTINCT director_id
    FROM movies
    WHERE budget <= 1000000
) ;

SELECT directors.name, SUM(movies.vote_count) AS total_votes
FROM directors
JOIN movies ON directors.id = movies.director_id
GROUP BY directors.name
HAVING COUNT(*) >= 4
ORDER BY total_votes DESC;

SELECT directors.name, COUNT(*) AS num_high_rated_movies
FROM directors
JOIN movies ON directors.id = movies.director_id
WHERE movies.vote_average > 7.0
GROUP BY directors.name
HAVING num_high_rated_movies > 2;

SELECT directors.name, AVG(movies.revenue) AS avg_revenue
FROM directors
JOIN movies ON directors.id = movies.director_id
GROUP BY directors.name
HAVING COUNT(*) > 2
ORDER BY avg_revenue DESC
LIMIT 3;

SELECT *
FROM movies
WHERE title LIKE '%War%' 
AND release_date BETWEEN '2000-01-01' AND '2009-12-31'
AND vote_count >= 100
ORDER BY vote_average DESC;

SELECT directors.name, COUNT(*) AS num_movies, AVG(movies.vote_average) AS avg_vote_average
FROM directors
JOIN movies ON directors.id = movies.director_id
WHERE strftime('%Y', release_date) >= '2000'
GROUP BY directors.name
ORDER BY num_movies DESC, avg_vote_average DESC
LIMIT 5;