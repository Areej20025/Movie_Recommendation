

select * 
from movies;

--1. ننشأ نسخه من الجدول الاصلس لنقوم بالتعديل عليه
SELECT *
INTO copy_movies
FROM Movies;
--add PRIMARY KEY
ALTER TABLE copy_movies
ADD CONSTRAINT PK_copy_movies PRIMARY KEY (movieid);


select * 
from copy_movies;
--2.استكشف هل يوجد تكرار؟

WITH Movies_Dup AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY title, genres
            ORDER BY movieId
        ) AS Row_Num
    FROM copy_movies
)
SELECT *
FROM Movies_Dup
WHERE Row_Num > 1; --14 فلم مكرر


--حذف التكرار من جدول الافلام.3

WITH Movies_Dup AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY title, genres
            ORDER BY movieId
        ) AS Row_Num
    FROM copy_movies
)
DELETE FROM copy_movies   
WHERE movieId IN (
    SELECT movieId
    FROM Movies_Dup
    WHERE Row_Num > 1
);--تم حذف 14 rows



--اشوف هل تأثرت التقييمات اللي في جدول التقييمات؟ 
--1.اسوي نسخه من جدول التقييمات

select * 
from ratings;
--copy table ratings
SELECT *
INTO copy_ratings
FROM ratings;

--add foring key on table copy_ratings
ALTER TABLE copy_ratings
ADD CONSTRAINT FK_copy_ratings_movieid
FOREIGN KEY (movieId) REFERENCES copy_movies(movieId);

--2.اشوف هل تأثرت بعض التقييمات صار مالها فلم معين!
SELECT r.*
FROM copy_Ratings r
LEFT JOIN copy_movies m
    ON r.movieId = m.movieId
WHERE m.movieId IS NULL;--نعم7 تقييمات 

--اشوف ان 7 تقييمات لا تؤثر على مجموع التقييمات ف اخترت ان احذفها!

--3.DELETE null in table ratings
DELETE r
FROM copy_Ratings r
LEFT JOIN copy_movies m
ON r.movieId = m.movieId
WHERE m.movieId IS NULL;--حذفتهم ال 7 rows


--end remove duplecate
