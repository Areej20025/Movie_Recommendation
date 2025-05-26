

ALTER TABLE copy_movies
ADD release_year INT;


UPDATE copy_movies
SET release_year = CAST(SUBSTRING(title, LEN(title) - 4, 4) AS INT)
WHERE title LIKE '%(____)';  -- تأكد أن فيها أربع أرقام بين قوسين



UPDATE copy_movies
SET title = RTRIM(LEFT(title, LEN(title) - 7))  -- يحذف آخر 7 حروف (يشمل الفراغ قبل القوس)
WHERE title LIKE '%(____)';


SELECT * 
FROM copy_movies
where release_year ='2002';