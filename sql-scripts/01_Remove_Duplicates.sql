-- Step 1: Create a copy of the original Movies table to work on
SELECT *
INTO copy_movies
FROM Movies;

-- Add a Primary Key to uniquely identify each movie
ALTER TABLE copy_movies
ADD CONSTRAINT PK_copy_movies PRIMARY KEY (movieid);

-- Step 2: Check if there are duplicate movies based on title and genres
WITH Movies_Dup AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY title, genres -- Group by title and genres
            ORDER BY movieId           -- Order by movieId to decide which one to keep
        ) AS Row_Num
    FROM copy_movies
)
SELECT *
FROM Movies_Dup
WHERE Row_Num > 1;  -- These are duplicate records (all except the first)

-- Step 3: Delete duplicate movies, keep only one record for each movie
WITH Movies_Dup AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY title, genres
            ORDER BY movieId
        ) AS Row_Num
    FROM copy_movies
)
DELETE FROM copy_movies   
WHERE movieId IN (
    SELECT movieId
    FROM Movies_Dup
    WHERE Row_Num > 1
); -- Duplicates deleted

-- Step 4: Check if the ratings table is affected (some ratings might not match movies now)

-- First, create a copy of the ratings table to keep original safe
SELECT *
INTO copy_ratings
FROM ratings;

-- Add a foreign key constraint to link ratings to movies
ALTER TABLE copy_ratings
ADD CONSTRAINT FK_copy_ratings_movieid
FOREIGN KEY (movieId) REFERENCES copy_movies(movieId);

-- Step 5: Find ratings that don't have a matching movie (orphan ratings)
SELECT r.*
FROM copy_ratings r
LEFT JOIN copy_movies m ON r.movieId = m.movieId
WHERE m.movieId IS NULL;  -- These ratings have no matching movie

-- Step 6: Delete these orphan ratings because they have no valid movie
DELETE r
FROM copy_ratings r
LEFT JOIN copy_movies m ON r.movieId = m.movieId
WHERE m.movieId IS NULL;
