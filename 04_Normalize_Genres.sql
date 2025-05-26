
select *
from copy_movies;

/*
✅ الحل الأفضل:

نفصل جدول الأنواع عن جدول الربط، ونعمل جدول مرجعي يحتوي على نوع واحد فقط لكل genre:*/

--1. جدول الأنواع (مرجعي):
CREATE TABLE genre_names (
    genreid INT IDENTITY(1,1) PRIMARY KEY,
    genrename NVARCHAR(100) UNIQUE
);

--2. جدول الربط بين الأفلام والأنواع:

CREATE TABLE movie_genres (
    movieid INT,
    genreid INT,
    FOREIGN KEY (movieid) REFERENCES copy_movies(movieid),
    FOREIGN KEY (genreid) REFERENCES genre_names(genreid)
);

--3. نعبّي جدول الأنواع بدون تكرار:
INSERT INTO genre_names (genrename)
SELECT DISTINCT TRIM(value)
FROM copy_movies
CROSS APPLY STRING_SPLIT(genres, '|');--20 type of genres

--4. نربط الأفلام بالأنواع في جدول movie_genres:
INSERT INTO movie_genres (movieid, genreid)
SELECT m.movieid, g.genreid
FROM copy_movies m
CROSS APPLY STRING_SPLIT(m.genres, '|') AS s
JOIN genre_names g ON TRIM(s.value) = g.genrename;

--TEAST
SELECT *
FROM COPY_MOVIES;

--DELETE GENRES FTOM TABLE COPY_MOVIES
ALTER TABLE COPY_MOVIES
DROP Column genres;