
CREATE TABLE Movies (
    movieId INT PRIMARY KEY,
    title NVARCHAR(255),
    genres NVARCHAR(MAX)
);

CREATE TABLE Ratings (
    userId INT,
    movieId INT,
    rating FLOAT,
    timestamp BIGINT,
    FOREIGN KEY (movieId) REFERENCES Movies(movieId)
);