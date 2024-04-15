-- 1
SELECT title, release_date
FROM movies
WHERE release_date > '2000-01-01';

-- 2
SELECT *
FROM movies
WHERE budget BETWEEN 1000000 AND 10000000;

--3 
SELECT title, release_date, vote_average
FROM movies
WHERE title LIKE '%Star%';

--4
SELECT title, vote_count
FROM movies
WHERE vote_average > 7
ORDER BY vote_count DESC
LIMIT 5;

--5
SELECT title, release_date
FROM movies
WHERE release_date >= '2000-01-01' AND budget = 0
ORDER BY release_date;

-- 6
SELECT title, popularity
FROM movies
WHERE title LIKE '%Wars' AND release_date < '1980-01-01'
ORDER BY popularity DESC
LIMIT 5;

--7
SELECT title, release_date
FROM movies
WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31' AND revenue = 0;

--8
SELECT title, release_date
FROM movies
WHERE title LIKE '%Star%' AND release_date < '2000-01-01' AND vote_count > 100;

--9
SELECT title, vote_average, vote_count, revenue
FROM movies
WHERE (vote_average = 7.5 AND vote_count > 50 AND vote_count < 100)
   OR (revenue > 1000000 AND revenue < 2000000);

 -- 10
 SELECT *
FROM directors
WHERE name LIKE '%James%' AND (department != 'Directing' OR gender != 2);

-- 11
SELECT title, release_date, vote_count, popularity
FROM movies
WHERE (title LIKE '%Love%' AND release_date > '2010-01-01' AND vote_count BETWEEN 100 AND 300)
   OR (title LIKE '%Love%' AND popularity > 20 AND popularity < 50);

-- 12
SELECT title, vote_average, vote_count, revenue
FROM movies
WHERE (vote_average = 6.5 OR vote_average = 8.5) AND vote_count > 100
  AND (revenue > 50000000 OR revenue < 10000000);