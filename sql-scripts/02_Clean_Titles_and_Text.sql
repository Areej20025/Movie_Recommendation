-- Step 1: Preview the movies data before cleaning
SELECT * FROM copy_Movies;

-- Step 2: Preview the ratings data before cleaning
SELECT * FROM copy_Ratings;

-- Step 3: Check distinct movie titles to identify formatting issues
SELECT DISTINCT title
FROM copy_Movies
ORDER BY title;

-- Step 4: Check what happens if we trim spaces from the titles
SELECT title, TRIM(title) AS trimmed_title
FROM copy_Movies
ORDER BY title;

-- Step 5: Clean titles by trimming leading and trailing spaces
UPDATE copy_Movies
SET title = TRIM(title);

-- Step 6: Explore if there are unwanted characters at the start of titles, e.g., leading double quotes
SELECT DISTINCT title, TRIM(LEADING '"' FROM title) AS cleaned_title
FROM copy_Movies
ORDER BY title;

-- Step 7: Remove leading double quotes from titles
UPDATE copy_Movies
SET title = TRIM(LEADING '"' FROM title);

-- Step 8: Repeat the above two steps for other unwanted leading characters

-- Check for leading hash (#)
SELECT DISTINCT title, TRIM(LEADING '#' FROM title) AS cleaned_title
FROM copy_Movies
ORDER BY title;

UPDATE copy_Movies
SET title = TRIM(LEADING '#' FROM title);

-- Check for leading dollar sign ($)
SELECT DISTINCT title, TRIM(LEADING '$' FROM title) AS cleaned_title
FROM copy_Movies
ORDER BY title;

UPDATE copy_Movies
SET title = TRIM(LEADING '$' FROM title);

-- Check for leading asterisk (*)
SELECT DISTINCT title, TRIM(LEADING '*' FROM title) AS cleaned_title
FROM copy_Movies
ORDER BY title;

UPDATE copy_Movies
SET title = TRIM(LEADING '*' FROM title);

-- Check for leading dot (.)
SELECT DISTINCT title, TRIM(LEADING '.' FROM title) AS cleaned_title
FROM copy_Movies
ORDER BY title;

UPDATE copy_Movies
SET title = TRIM(LEADING '.' FROM title);

-- Step 9: Check distinct genres to understand data variety
SELECT DISTINCT genres FROM copy_Movies;

-- Step 10: Check for null or blank values in important columns to ensure data completeness
SELECT * FROM copy_Movies WHERE title IS NULL OR title = '';
-- No rows found - titles are all filled

SELECT * FROM copy_Movies WHERE genres IS NULL OR genres = '';
-- No rows found - genres are all filled

SELECT * FROM copy_Movies WHERE movieId IS NULL OR movieId = '';
-- No rows found - movie IDs are valid

SELECT * FROM copy_ratings WHERE rating IS NULL OR rating = '';
-- No rows found - ratings are valid

SELECT * FROM copy_ratings WHERE timestamp IS NULL OR timestamp = '';
-- No rows found - timestamps are valid
