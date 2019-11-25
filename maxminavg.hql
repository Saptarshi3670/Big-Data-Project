-- Queries Used for analysis
SELECT  popularity, popularity_bool,MAX(max_duration) AS max_duration, MIN(min_duration) AS min_duration, AVG(avg_duration) AS avg_duration  FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;


SELECT  popularity, popularity_bool,MAX(max_loudeness) AS max_loudeness, MIN(min_loudeness) AS min_loudeness, AVG(avg_loudeness) AS avg_loudeness  FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_instrumental) AS max_instrumental, MIN(min_instrumental) AS min_instrumental, AVG(avg_instrumental) AS avg_instrumental  FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_accousticness) AS max_accousticness, MIN(min_accousticness) AS min_accousticness, 
AVG(avg_accousticness) AS avg_accousticness  FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,sum(mode_zero_count) AS mode_zero_count, sum(mode_one_count) AS mode_one_count FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_danceability) AS max_danceability, MIN(min_danceability) AS min_danceability, AVG(avg_danceability) AS avg_danceability FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_energy) AS max_energy, MIN(min_energy) AS min_energy,
AVG(avg_energy) AS avg_energy FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_liveness) AS max_liveness, MIN(min_liveness) AS min_liveness, AVG(avg_liveness) AS avg_liveness FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_speechiness) AS max_speechiness, MIN(min_speechiness) AS min_speechiness, AVG(avg_speechiness) AS avg_speechiness FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_tempo) AS max_tempo, MIN(min_tempo) AS min_tempo, AVG(avg_tempo) AS avg_tempo FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

SELECT  popularity, popularity_bool,MAX(max_valence) AS max_valence,
MIN(min_valence) AS min_valence, AVG(avg_valence) AS avg_valence FROM 
musicDb.musicPopularityAnalysis
GROUP BY popularity, popularity_bool;

