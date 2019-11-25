
--pig -useHCatalog

TRACK_RELATION = LOAD '/user/maria_dev/spotify/spotify-original.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE','UNIX', 'SKIP_INPUT_HEADER') AS (artist_name:chararray,track_id:chararray,track_name:chararray, acousticness:double, danceability:double, duration:int, energy:double,instrumental:double,key:int, liveness:double, loudness:double, mode:int,speechiness:double, tempo:double, time_signature:int, valence:double, popularity:int, popularity_bool:int);


replaceComma = FOREACH TRACK_RELATION GENERATE REPLACE (artist_name, ',', ';') AS artist_name,track_id AS track_id,REPLACE (track_name, ',', ';') AS track_name,acousticness AS acousticness,danceability AS danceability,duration AS duration,energy AS energy,instrumental AS instrumental,key AS key,liveness AS liveness,loudness AS loudness,mode AS mode,speechiness AS speechiness,tempo AS tempo,time_signature AS time_signature,valence AS valence,popularity AS popularity, popularity_bool AS popularity_bool;



STORE replaceComma INTO 'musicDb.spotifyMusic' USING org.apache.hive.hcatalog.pig.HCatStorer();





