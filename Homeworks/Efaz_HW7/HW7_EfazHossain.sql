-- 1
SELECT name, department
FROM directors;

-- 2
SELECT title
FROM movies
WHERE popularity > 5;

-- 3
SELECT name, id
FROM directors
WHERE department = 'Directing' AND gender = 2;

--4
SELECT name
FROM directors
WHERE name LIKE '%Sam%';

-- 5
SELECT *
FROM movies
ORDER BY release_date
LIMIT 10;

-- 6
SELECT *
FROM movies
WHERE title LIKE '%Star%' AND vote_average > 7;

-- 7
SELECT title
FROM movies
WHERE release_date BETWEEN '1995-01-01' AND '2000-12-31' AND revenue <= 10000000;

-- 8
SELECT name
FROM directors
WHERE uid > 7000 OR uid < 100;

-- 9
SELECT title
FROM movies
WHERE vote_count BETWEEN 50 AND 100 AND vote_average = 7.0;

-- 10
SELECT name
FROM directors
WHERE name LIKE '%John%' AND uid < 10000 AND uid > 5000;

-- 11
SELECT title
FROM movies
WHERE (uid % 2 <> 0) AND (vote_count % 2 = 0) AND vote_count > 500;

-- 12
SELECT title
FROM movies
WHERE (vote_average BETWEEN 6.0 AND 8.0 AND vote_count = 200)
   OR (budget BETWEEN 100000 AND 500000);
