
DROP TABLE IF EXISTS Movie;

CREATE TABLE Movie 
(
  MovieID int NOT NULL,
  Title varchar(50) NOT NULL,
  YearReleased char(4) NOT NULL,
  Primary Key (MovieID)
);

/* since only doing 6 movies, it seemed easier to just load in the data this way */

INSERT INTO Movie(MovieID, Title, YearReleased)
VALUES (1, "The Matrix", "1999"),
	   (2, "The Matrix Reloaded", "2003"),
       (3, "The Matrix Revolutions", "2003"),
       (4, "The Matrix, Resurections", "2021"),
       (5, "Ready Player One", "2018"),
       (6, "Tron", "1982");
       
DROP TABLE IF EXISTS Rating;

CREATE TABLE Rating 
(
  RatingID Char(5) NOT NULL,
  ReviewerID Char(5) NOT NULL,
  MovieID int NOT NULL,
  Ranking int NULL, 
  Primary Key (RatingID),
  Foreign Key (MovieID) REFERENCES Movie(MovieID)
  );

/* IMPORTANT: Change path as needed on your machine */

LOAD DATA INFILE 'c:\data\Movie Survey.csv' 
INTO TABLE Rating
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(RatingID, ReviewerID, MovieID, @vRanking)
SET Ranking = NULLIF(@vRanking,-1);
 
select * from Movie;
select ReviewerID, count(*) from Rating group by ReviewerID;
