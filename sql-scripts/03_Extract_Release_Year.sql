-- Step 1: Add a new column 'release_year' to store the movie release year
ALTER TABLE copy_movies
ADD release_year INT;

-- Step 2: Extract the year from the title when it is in the format '(YYYY)'
UPDATE copy_movies
SET release_year = CAST(SUBSTRING(title, LEN(title) - 4, 4) AS INT)
WHERE title LIKE '%(____)';  -- This matches titles ending with (YYYY)

-- Step 3: Remove the year (including the parentheses) from the movie title
UPDATE copy_movies
SET title = RTRIM(LEFT(title, LEN(title) - 7))  -- Remove last 7 characters (space + parentheses + year)
WHERE title LIKE '%(____)';

-- Step 4: Verify the extraction by querying movies from a specific year, e.g. 2002
SELECT * 
FROM copy_movies
WHERE release_year = 2002;
