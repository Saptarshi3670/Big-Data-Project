--Inserting data into multiple tables from musicDb.spotifymusic

INSERT INTO TABLE musicDb.musicPopularityAnalysis
SELECT "POPULAR" AS popularity,mode AS mode, popularity_bool, MAX(acousticness) AS max_accousticness, MIN(acousticness) AS min_accousticness, 
AVG(acousticness) AS avg_accousticness, MAX(danceability) AS max_danceability, MIN(danceability) AS min_danceability, AVG(danceability) AS avg_danceability, 
MAX(duration) AS max_duration, MIN(duration) AS min_duration, AVG(duration) AS avg_duration, MAX(energy) AS max_energy, MIN(energy) AS min_energy,
AVG(energy) AS avg_energy, MAX(instrumental) AS max_instrumental, MIN(instrumental) AS min_instrumental, AVG(instrumental) AS avg_instrumental,
MAX(key) AS max_key, MIN(key) AS min_key, AVG(key) AS avg_key, MAX(liveness) AS max_liveness, MIN(liveness) AS min_liveness, AVG(liveness) AS avg_liveness,
MAX(loudness) AS max_loudeness, MIN(loudness) AS min_loudeness, AVG(loudness) AS avg_loudeness, 
CASE WHEN MODE = 0 THEN COUNT(MODE) ELSE 0 END AS mode_zero_count, CASE WHEN MODE = 1 THEN COUNT(MODE) ELSE 0 END AS mode_one_count,
MAX(speechiness) AS max_speechiness, MIN(speechiness) AS min_speechiness, AVG(speechiness) AS avg_speechiness,
MAX(tempo) AS max_tempo, MIN(tempo) AS min_tempo, AVG(tempo) AS avg_tempo, MAX(time_signature) AS max_time_signature, 
MIN(time_signature) AS min_time_signature, AVG(time_signature) AS avg_time_signature, MAX(valence) AS max_valence,
MIN(valence) AS min_valence, AVG(valence) AS avg_valence,MAX(popularity) AS max_popularity, MIN(popularity) AS min_popularity,
AVG(popularity) AS avg_popularity FROM musicDb.spotifymusic WHERE mode = 0 AND popularity_bool = 1 GROUP BY mode, popularity_bool;


INSERT INTO TABLE musicDb.musicPopularityAnalysis
SELECT "POPULAR" AS POPULARITY,mode AS MODE, popularity_bool, MAX(acousticness) AS max_accousticness, MIN(acousticness) AS min_accousticness, 
AVG(acousticness) AS avg_accousticness, MAX(danceability) AS max_danceability, MIN(danceability) AS min_danceability, AVG(danceability) AS avg_danceability, 
MAX(duration) AS max_duration, MIN(duration) AS min_duration, AVG(duration) AS avg_duration, MAX(energy) AS max_energy, MIN(energy) AS min_energy,
AVG(energy) AS avg_energy, MAX(instrumental) AS max_instrumental, MIN(instrumental) AS min_instrumental, AVG(instrumental) AS avg_instrumental,
MAX(key) AS max_key, MIN(key) AS min_key, AVG(key) AS avg_key, MAX(liveness) AS max_liveness, MIN(liveness) AS min_liveness, AVG(liveness) AS avg_liveness,
MAX(loudness) AS max_loudeness, MIN(loudness) AS min_loudeness, AVG(loudness) AS avg_loudeness, 
CASE WHEN MODE = 0 THEN COUNT(MODE) ELSE 0 END AS mode_zero_count, CASE WHEN MODE = 1 THEN COUNT(MODE) ELSE 0 END AS mode_one_count,
MAX(speechiness) AS max_speechiness, MIN(speechiness) AS min_speechiness, AVG(speechiness) AS avg_speechiness,
MAX(tempo) AS max_tempo, MIN(tempo) AS min_tempo, AVG(tempo) AS avg_tempo, MAX(time_signature) AS max_time_signature, 
MIN(time_signature) AS min_time_signature, AVG(time_signature) AS avg_time_signature, MAX(valence) AS max_valence,
MIN(valence) AS min_valence, AVG(valence) AS avg_valence,MAX(popularity) AS max_popularity, MIN(popularity) AS min_popularity,
AVG(popularity) AS avg_popularity FROM musicDb.spotifymusic WHERE mode = 1 and popularity_bool = 1 GROUP BY mode, popularity_bool;


INSERT INTO TABLE musicDb.musicPopularityAnalysis
SELECT "UNPOPULAR" AS POPULARITY,mode AS MODE, popularity_bool, MAX(acousticness) AS max_accousticness, MIN(acousticness) AS min_accousticness, 
AVG(acousticness) AS avg_accousticness, MAX(danceability) AS max_danceability, MIN(danceability) AS min_danceability, AVG(danceability) AS avg_danceability, 
MAX(duration) AS max_duration, MIN(duration) AS min_duration, AVG(duration) AS avg_duration, MAX(energy) AS max_energy, MIN(energy) AS min_energy,
AVG(energy) AS avg_energy, MAX(instrumental) AS max_instrumental, MIN(instrumental) AS min_instrumental, AVG(instrumental) AS avg_instrumental,
MAX(key) AS max_key, MIN(key) AS min_key, AVG(key) AS avg_key, MAX(liveness) AS max_liveness, MIN(liveness) AS min_liveness, AVG(liveness) AS avg_liveness,
MAX(loudness) AS max_loudeness, MIN(loudness) AS min_loudeness, AVG(loudness) AS avg_loudeness, 
CASE WHEN MODE = 0 THEN COUNT(MODE) ELSE 0 END AS mode_zero_count, CASE WHEN MODE = 1 THEN COUNT(MODE) ELSE 0 END AS mode_one_count,
MAX(speechiness) AS max_speechiness, MIN(speechiness) AS min_speechiness, AVG(speechiness) AS avg_speechiness,
MAX(tempo) AS max_tempo, MIN(tempo) AS min_tempo, AVG(tempo) AS avg_tempo, MAX(time_signature) AS max_time_signature, 
MIN(time_signature) AS min_time_signature, AVG(time_signature) AS avg_time_signature, MAX(valence) AS max_valence,
MIN(valence) AS min_valence, AVG(valence) AS avg_valence,MAX(popularity) AS max_popularity, MIN(popularity) AS min_popularity,
AVG(popularity) AS avg_popularity FROM musicDb.spotifymusic WHERE mode = 0 AND popularity_bool = 0 GROUP BY mode, popularity_bool;

INSERT INTO TABLE musicDb.musicPopularityAnalysis
SELECT "UNPOPULAR" AS POPULARITY,mode AS MODE, popularity_bool, MAX(acousticness) AS max_accousticness, MIN(acousticness) AS min_accousticness, 
AVG(acousticness) AS avg_accousticness, MAX(danceability) AS max_danceability, MIN(danceability) AS min_danceability, AVG(danceability) AS avg_danceability, 
MAX(duration) AS max_duration, MIN(duration) AS min_duration, AVG(duration) AS avg_duration, MAX(energy) AS max_energy, MIN(energy) AS min_energy,
AVG(energy) AS avg_energy, MAX(instrumental) AS max_instrumental, MIN(instrumental) AS min_instrumental, AVG(instrumental) AS avg_instrumental,
MAX(key) AS max_key, MIN(key) AS min_key, AVG(key) AS avg_key, MAX(liveness) AS max_liveness, MIN(liveness) AS min_liveness, AVG(liveness) AS avg_liveness,
MAX(loudness) AS max_loudeness, MIN(loudness) AS min_loudeness, AVG(loudness) AS avg_loudeness, 
CASE WHEN MODE = 0 THEN COUNT(MODE) ELSE 0 END AS mode_zero_count, CASE WHEN MODE = 1 THEN COUNT(MODE) ELSE 0 END AS mode_one_count,
MAX(speechiness) AS max_speechiness, MIN(speechiness) AS min_speechiness, AVG(speechiness) AS avg_speechiness,
MAX(tempo) AS max_tempo, MIN(tempo) AS min_tempo, AVG(tempo) AS avg_tempo, MAX(time_signature) AS max_time_signature, 
MIN(time_signature) AS min_time_signature, AVG(time_signature) AS avg_time_signature, MAX(valence) AS max_valence,
MIN(valence) AS min_valence, AVG(valence) AS avg_valence,MAX(popularity) AS max_popularity, MIN(popularity) AS min_popularity,
AVG(popularity) AS avg_popularity FROM musicDb.spotifymusic WHERE mode = 1 and popularity_bool = 0 GROUP BY mode, popularity_bool;

INSERT INTO TABLE musicDb.popTimeSignWise
SELECT popularity_bool, time_signature, count(time_signature) FROM musicDb.spotifymusic GROUP BY popularity_bool, time_signature;

INSERT INTO TABLE musicDB.timeSignWise
SELECT time_signature, count(time_signature) FROM musicDb.spotifymusic GROUP BY time_signature;

INSERT INTO TABLE musicDb.popKeyWise
SELECT popularity_bool, key, count(key) FROM musicDb.spotifymusic GROUP BY popularity_bool, key;

INSERT INTO TABLE musicDB.keyWise
SELECT key, count(key) FROM musicDb.spotifymusic GROUP BY key;
