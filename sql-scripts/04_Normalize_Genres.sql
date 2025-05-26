-- Step 1: Create a new table for unique genres
CREATE TABLE genre_names (
    genreid INT IDENTITY(1,1) PRIMARY KEY,
    genrename NVARCHAR(100) UNIQUE
);

-- Step 2: Create a linking table between movies and genres (many-to-many relationship)
CREATE TABLE movie_genres (
    movieid INT,
    genreid INT,
    FOREIGN KEY (movieid) REFERENCES copy_movies(movieid),
    FOREIGN KEY (genreid) REFERENCES genre_names(genreid)
);

-- Step 3: Insert distinct genres into genre_names table by splitting the genres string
INSERT INTO genre_names (genrename)
SELECT DISTINCT TRIM(value)
FROM copy_movies
CROSS APPLY STRING_SPLIT(genres, '|');  -- Splits genres separated by '|'

-- Step 4: Link each movie to its genres in the movie_genres table
INSERT INTO movie_genres (movieid, genreid)
SELECT m.movieid, g.genreid
FROM copy_movies m
CROSS APPLY STRING_SPLIT(m.genres, '|') AS s
JOIN genre_names g ON TRIM(s.value) = g.genrename;

-- Step 5: Remove the original genres column from copy_movies as it is now normalized
ALTER TABLE copy_movies
DROP COLUMN genres;
