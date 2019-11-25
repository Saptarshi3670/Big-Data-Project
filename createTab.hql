--created database
CREATE DATABASE IF NOT EXISTS musicDb;



--created tables
CREATE TABLE IF NOT EXISTS musicDb.spotifyMusic(artist_name STRING,track_id STRING,track_name STRING, acousticness DOUBLE, 
danceability DOUBLE,duration INT, energy DOUBLE,instrumental DOUBLE,key INT, liveness DOUBLE, loudness DOUBLE, mode INT,
speechiness DOUBLE, tempo DOUBLE, time_signature INT, valence DOUBLE, popularity INT, popularity_bool INT) COMMENT 'Music Track Details'
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;


CREATE TABLE IF NOT EXISTS musicDb.musicPopularityAnalysis(popularity STRING,mode INT, popularity_bool INT, max_accousticness DOUBLE, 
min_accousticness DOUBLE, avg_accousticness DOUBLE, max_danceability DOUBLE, min_danceability DOUBLE, avg_danceability DOUBLE, 
max_duration DOUBLE, min_duration DOUBLE, avg_duration DOUBLE, max_energy DOUBLE, min_energy DOUBLE,
avg_energy DOUBLE, max_instrumental DOUBLE, min_instrumental DOUBLE, avg_instrumental DOUBLE,
max_key INT, min_key INT, avg_key DOUBLE, max_liveness DOUBLE, min_liveness DOUBLE, avg_liveness DOUBLE,
max_loudeness DOUBLE, min_loudeness DOUBLE, avg_loudeness DOUBLE, 
mode_zero_count INT, mode_one_count INT,max_speechiness DOUBLE, min_speechiness DOUBLE, avg_speechiness DOUBLE,
max_tempo DOUBLE, min_tempo DOUBLE, avg_tempo DOUBLE, max_time_signature INT, 
min_time_signature INT, avg_time_signature DOUBLE, max_valence DOUBLE,
min_valence DOUBLE, avg_valence DOUBLE, max_popularity DOUBLE, min_popularity DOUBLE,
avg_popularity DOUBLE) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS musicDB.popTimeSignWise(popularity_bool INT, time_signature INT, total INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS musicDB.timeSignWise(time_signature INT, total INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS musicDB.popKeyWise(popularity_bool INT, key INT, total INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS musicDB.keyWise(key INT, total INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;






