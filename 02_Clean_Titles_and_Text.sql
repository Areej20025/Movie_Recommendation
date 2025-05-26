
--Movies
 SELECT *
 FROM copy_Movies;


 --Ratings
 SELECT *
 FROM copy_Ratings;


 --standardize the data
 SELECT distinct title
 from copy_Movies
 order by 1;


 SELECT  title, trim(title)
 from copy_Movies
 order by 1;

 UPDATE Movies
 SET title= TRIM(title);



 SELECT distinct title, trim(LEADING '"' FROM title)
 from copy_Movies
 order by 1;
 --UPDATE
 UPDATE copy_Movies
 SET title = trim(LEADING '"' FROM title)

 
 SELECT distinct title, trim(LEADING '#' FROM title)
 from copy_Movies
 order by 1;
 --UPDATE
 UPDATE copy_Movies
 SET title = trim(LEADING '#' FROM title)


 SELECT distinct title, trim(LEADING '$' FROM title)
 from copy_Movies
 order by 1;

  --UPDATE
 UPDATE copy_Movies
 SET title = trim(LEADING '$' FROM title)

 SELECT distinct title, trim(LEADING '*' FROM title)
 from copy_Movies
 order by 1;

  --UPDATE
 UPDATE copy_Movies
 SET title = trim(LEADING '*' FROM title)



 SELECT distinct title, trim(LEADING '.' FROM title)
 from copy_Movies
 order by 1;

 
  --UPDATE
 UPDATE copy_Movies
 SET title = trim(LEADING '.' FROM title)

 --Genres
 SELECT distinct genres
 FROM copy_Movies;


 --null value OR BLANK VALUES
SELECT *
FROM copy_Movies
WHERE title is null 
OR title=' ' ;--no thing


SELECT *
FROM copy_Movies
WHERE genres is null
OR genres=' '; --no thing


SELECT *
FROM copy_Movies
WHERE Movieid is null
OR Movieid ='';--no thing

SELECT *
FROM copy_ratings
WHERE rating is null
OR  rating ='';--no

SELECT *
FROM copy_ratings
WHERE timestamp is null
OR timestamp ='';--no thing



