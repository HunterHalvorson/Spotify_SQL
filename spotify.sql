-- Advanced SQL Project -- Spotify Datasets

-- EDA
SELECT COUNT(*)
FROM spotify;

SELECT COUNT(DISTINCT artist)
FROM spotify;

SELECT COUNT(DISTINCT album)
FROM spotify;

SELECT DISTINCT album_type
FROM spotify;

SELECT MAX(duration_min), MIN(duration_min)
FROM spotify;

SELECT *
FROM spotify
WHERE duration_min = 0;

DELETE FROM spotify
WHERE duration_min = 0;

SELECT DISTINCT channel
FROM spotify;

SELECT DISTINCT most_played_on
FROM spotify;

-- -----------------------------
-- 		Data Analysis (Easy)
-- -----------------------------
-- Q1. Retreive the names of all tracks that have more than 1 billion streams
SELECT
	track
FROM
	spotify
WHERE
	stream > 1000000000;
	
-- Q2. List all Almbums with their respective artists
SELECT
	DISTINCT album,
	artist
FROM
	spotify
ORDER BY
	1;
-- Q3. Get the total number of comments for tracks where liscenced = True
SELECT
	SUM(comments) AS total_comments
FROM
	spotify
WHERE
	licensed = 'true';
-- Q4. Find all tracks that belong to the album type single
SELECT
	track
FROM
	spotify
WHERE
	album_type = 'single';
	-- note: ILIKE (case-insensitve) could be used for single, SIngle, etc
-- Q5. Count the total number of tracks by each artist
SELECT
	artist,
	count(track) AS total_no_songs
FROM
	spotify
GROUP BY artist
ORDER BY 2 DESC;


-- -----------------------------
-- 		Data Analysis (Medium)
-- -----------------------------
-- Q6. Calculate the average danceability of tracks in each album
SELECT
	track,
	album,
	AVG(danceability)
FROM
	spotify
GROUP BY
	1, 2
ORDER BY
	3 DESC;
	
-- Q7. Find the top 5 tracks with the highest energy values
SELECT
	track,
	MAX(energy)
FROM
	spotify
GROUP BY
	1
ORDER BY
	2 DESC
LIMIT	
	5;
	
-- Q8. List all tracks along with their views and likes where official_video = True
SELECT
	track,
	SUM(views) AS total_views,
	SUM(likes) AS total_likes
FROM
	spotify
WHERE
	official_video = 'true'
GROUP BY 
	1
ORDER BY
	2 DESC, 3 DESC;
-- Q9. For each album, calculate the total views of all associated tracks
SELECT
	album,
	SUM(views)
FROM
	spotify
GROUP BY
	album
ORDER BY
	2 DESC;
-- Q10. Retreive the track names that have been streamed on Spotify more than youtube
SELECT
	*
FROM
(
	SELECT
		track,
		COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END), 0) as streamed_on_youtube,
		COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) as streamed_on_spotify
	FROM 
		spotify
	GROUP BY
		1
) as t1
WHERE streamed_on_spotify > streamed_on_youtube AND streamed_on_youtube <> 0;
	

-- -----------------------------
-- 		Data Analysis (Advanced)
-- -----------------------------

-- Q11. Find the top 3 most viewed tracks for each artist using a window function
WITH ranking_artist
AS 
(
	SELECT
		artist,
		track,
		SUM(views) as total_views,
		DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(VIEWS) DESC) AS rank
	FROM
		spotify
	GROUP BY
		1, 2
	ORDER BY 
		1, 3 DESC
)
SELECT * FROM ranking_artist
WHERE rank <= 3;

-- Q12. Write a query to find tracks where the liveness score is above the average
SELECT
	track
FROM
	spotify
WHERE
	liveness > (SELECT AVG(liveness) FROM spotify);

-- Q13. Use a with clause to calculate the difference between the highest and lowest energy values for tracks in each album
WITH cte
AS
(
	SELECT
		album,
		MAX(energy) AS highest_energy,
		MIN(energy) AS lowest_energy
	FROM
		spotify
	GROUP BY
		1
)
SELECT
	album,
	highest_energy - lowest_energy AS energy_diff
FROM
	cte
ORDER BY
	2 DESC;





