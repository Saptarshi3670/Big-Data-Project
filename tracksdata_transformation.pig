REGISTER /usr/hdp/current/pig-client/lib/piggybank.jar;

rmf /user/maria_dev/project_output;

TRACK_RELATION  = LOAD '/user/maria_dev/music/TRACKS.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artists_mb_id: chararray, artist_playmeid: int, artist_7digitalid:int, artist_familarity:double, artist_name:chararray, artist_hotttnesss:double, artist_location:chararray, release:chararray, release_7digitalid:int, song_id:chararray, title:chararray, song_hotttnesss:double, track_7digitalid:int, analysis_sample_rate:int, audio_md5:chararray, duration:int, end_of_fade_in:double, energy:int, key:int, key_confidence:double, loudness:double, mode:int, mode_confidence:double, start_of_fade_out:double, tempo:double, time_signature:double, time_signature_confidence:double, track_id:chararray, year:int);

SIMILAR_ARTIST = LOAD '/user/maria_dev/music/similar_artists.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, track_id:chararray, similar_artists:chararray);

DISTINCT_SIMILAR_ARTIST = DISTINCT SIMILAR_ARTIST;

JN_TRACK_RELATION = JOIN TRACK_RELATION BY (artist_id, track_id), SIMILAR_ARTIST BY (artist_id, track_id);

STORE DISTINCT_SIMILAR_ARTIST into '/user/maria_dev/project_output/similar_artist/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

ARTIST_TERMS = LOAD '/user/maria_dev/music/artist_terms.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artist_terms:chararray, artist_terms_freq:chararray, artist_terms_weight:chararray);

DISTINCT_ARTIST_TERMS = DISTINCT ARTIST_TERMS;

JN_TR_RE_AT = JOIN JN_TRACK_RELATION BY TRACK_RELATION::artist_id, DISTINCT_ARTIST_TERMS BY artist_id;

STORE DISTINCT_ARTIST_TERMS into '/user/maria_dev/project_output/artist_terms/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');


SEGMENTS = LOAD '/user/maria_dev/music/segments.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, segments_start:chararray, segments_confidence:chararray, segments_pitches:chararray, segments_timbre:chararray, segments_loudness_max:chararray, segments_loudness_max_time:chararray, segments_loudness_start:chararray);

JN_TR_SM = JOIN JN_TR_RE_AT BY TRACK_RELATION::track_id, SEGMENTS BY track_id;

STORE SEGMENTS into '/user/maria_dev/project_output/segments/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');


SECTIONS = LOAD '/user/maria_dev/music/sections.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, sections_start:chararray, sections_confidence:chararray);


JN_TR_SECTIONS = JOIN JN_TR_SM BY TRACK_RELATION::track_id, SECTIONS BY track_id;


STORE SECTIONS into '/user/maria_dev/project_output/sections/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

BEATS = LOAD '/user/maria_dev/music/beats.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, beats_start:chararray, beats_confidence:chararray);

JN_TR_BEATS = JOIN JN_TR_SECTIONS BY TRACK_RELATION::track_id, BEATS by track_id;

STORE BEATS into '/user/maria_dev/project_output/beats/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');


BARS = LOAD '/user/maria_dev/music/bars.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, bars_start:chararray, bars_confidence:chararray);

JN_TR_BARS = JOIN JN_TR_BEATS BY TRACK_RELATION::track_id, BARS BY track_id;

STORE BARS into '/user/maria_dev/project_output/bars/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');


TATUMS = LOAD '/user/maria_dev/music/tatums.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, tatums_start:chararray, tatums_confidence:chararray);

JN_TR_TATUMS = JOIN JN_TR_BARS BY TRACK_RELATION::track_id, TATUMS BY track_id;

STORE TATUMS into '/user/maria_dev/project_output/tatums/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

MBTAGS = LOAD '/user/maria_dev/music/mbtags.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artist_mbtags:chararray, artist_mbtags_count:chararray);

JN_TR_MBTAGS = JOIN JN_TR_TATUMS BY TRACK_RELATION::artist_id, MBTAGS by artist_id;

STORE MBTAGS into '/user/maria_dev/project_output/mbtags/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

STORE JN_TR_MBTAGS into '/user/maria_dev/project_output/tracks/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');
