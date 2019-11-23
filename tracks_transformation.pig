REGISTER /usr/hdp/current/pig-client/lib/piggybank.jar;

rmf /user/maria_dev/project_output;

TRACK_RELATION  = LOAD '/user/maria_dev/music/TRACKS.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artists_mb_id: chararray, artist_playmeid: int, artist_7digitalid:int, artist_familarity:double, artist_name:chararray, artist_hotttnesss:double, artist_location:chararray, release:chararray, release_7digitalid:int, song_id:chararray, title:chararray, song_hotttnesss:double, track_7digitalid:int, analysis_sample_rate:int, audio_md5:chararray, duration:int, end_of_fade_in:double, energy:int, key:int, key_confidence:double, loudness:double, mode:int, mode_confidence:double, start_of_fade_out:double, tempo:double, time_signature:double, time_signature_confidence:double, track_id:chararray, year:int);

SIMILAR_ARTIST = LOAD '/user/maria_dev/music/similar_artists.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, track_id:chararray, similar_artists:chararray);

DISTINCT_SIMILAR_ARTIST = DISTINCT SIMILAR_ARTIST;

JN_TRACK_RELATION = JOIN TRACK_RELATION BY (artist_id, track_id), SIMILAR_ARTIST BY (artist_id, track_id);

R_TR_RELATION = FOREACH JN_TRACK_RELATION GENERATE TRACK_RELATION::artist_id AS artist_id, TRACK_RELATION::artists_mb_id AS artists_mb_id, TRACK_RELATION::artist_playmeid AS artist_playmeid, TRACK_RELATION::artist_7digitalid AS artist_7digitalid, TRACK_RELATION::artist_familarity AS artist_familarity, TRACK_RELATION::artist_name AS artist_name, TRACK_RELATION::artist_hotttnesss AS artist_hotttnesss, TRACK_RELATION::artist_location AS artist_location, TRACK_RELATION::release AS release, TRACK_RELATION::release_7digitalid AS release_7digitalid, TRACK_RELATION::song_id AS song_id, TRACK_RELATION::title AS title, TRACK_RELATION::song_hotttnesss AS song_hotttnesss, TRACK_RELATION::track_7digitalid AS track_7digitalid, TRACK_RELATION::analysis_sample_rate AS analysis_sample_rate, TRACK_RELATION::audio_md5 AS audio_md5, TRACK_RELATION::duration AS duration, TRACK_RELATION::end_of_fade_in AS end_of_fade_in, TRACK_RELATION::energy AS energy, TRACK_RELATION::key AS key, TRACK_RELATION::key_confidence AS key_confidence, TRACK_RELATION::loudness AS loudness, TRACK_RELATION::mode AS mode, TRACK_RELATION::mode_confidence AS mode_confidence, TRACK_RELATION::start_of_fade_out AS start_of_fade_out, TRACK_RELATION::tempo AS tempo, TRACK_RELATION::time_signature AS time_signature, TRACK_RELATION::time_signature_confidence AS time_signature_confidence, TRACK_RELATION::track_id AS track_id, TRACK_RELATION::year AS year, SIMILAR_ARTIST::similar_artists AS similar_artists;

STORE R_TR_RELATION into '/user/maria_dev/project_output/R_TR_RELATION/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

R_TR = LOAD '/user/maria_dev/project_output/R_TR_RELATION/*' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artists_mb_id: chararray, artist_playmeid: int, artist_7digitalid:int, artist_familarity:double, artist_name:chararray, artist_hotttnesss:double, artist_location:chararray, release:chararray, release_7digitalid:int, song_id:chararray, title:chararray, song_hotttnesss:double, track_7digitalid:int, analysis_sample_rate:int, audio_md5:chararray, duration:int, end_of_fade_in:double, energy:int, key:int, key_confidence:double, loudness:double, mode:int, mode_confidence:double, start_of_fade_out:double, tempo:double, time_signature:double, time_signature_confidence:double, track_id:chararray, year:int, similar_artists:chararray);

ARTIST_TERMS = LOAD '/user/maria_dev/music/artist_terms.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artist_terms:chararray, artist_terms_freq:chararray, artist_terms_weight:chararray);

DISTINCT_ARTIST_TERMS = DISTINCT ARTIST_TERMS;

JN_TR_RE_AT = JOIN R_TR BY artist_id, DISTINCT_ARTIST_TERMS BY artist_id;

TR_RE_AT = FOREACH JN_TR_RE_AT GENERATE R_TR::artist_id AS artist_id, R_TR::artists_mb_id AS artists_mb_id, R_TR::artist_playmeid AS artist_playmeid, R_TR::artist_7digitalid AS artist_7digitalid, R_TR::artist_familarity AS artist_familarity, R_TR::artist_name AS artist_name, R_TR::artist_hotttnesss AS artist_hotttnesss, R_TR::artist_location AS artist_location, R_TR::release AS release, R_TR::release_7digitalid AS release_7digitalid, R_TR::song_id AS song_id, R_TR::title AS title, R_TR::song_hotttnesss AS song_hotttnesss, R_TR::track_7digitalid AS track_7digitalid, R_TR::analysis_sample_rate AS analysis_sample_rate, R_TR::audio_md5 AS audio_md5, R_TR::duration AS duration, R_TR::end_of_fade_in AS end_of_fade_in, R_TR::energy AS energy, R_TR::key AS key, R_TR::key_confidence AS key_confidence, R_TR::loudness AS loudness, R_TR::mode AS mode, R_TR::mode_confidence AS mode_confidence, R_TR::start_of_fade_out AS start_of_fade_out, R_TR::tempo AS tempo, R_TR::time_signature AS time_signature, R_TR::time_signature_confidence AS time_signature_confidence, R_TR::track_id AS track_id, R_TR::year AS year, R_TR::similar_artists AS similar_artists, DISTINCT_ARTIST_TERMS::artist_terms AS artist_terms, DISTINCT_ARTIST_TERMS::artist_terms_freq AS artist_terms_freq, DISTINCT_ARTIST_TERMS::artist_terms_weight AS artist_terms_weight;

STORE TR_RE_AT into '/user/maria_dev/project_output/TR_RE_AT/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

TR_AT = LOAD '/user/maria_dev/project_output/TR_RE_AT/*' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artists_mb_id: chararray, artist_playmeid: int, artist_7digitalid:int, artist_familarity:double, artist_name:chararray, artist_hotttnesss:double, artist_location:chararray, release:chararray, release_7digitalid:int, song_id:chararray, title:chararray, song_hotttnesss:double, track_7digitalid:int, analysis_sample_rate:int, audio_md5:chararray, duration:int, end_of_fade_in:double, energy:int, key:int, key_confidence:double, loudness:double, mode:int, mode_confidence:double, start_of_fade_out:double, tempo:double, time_signature:double, time_signature_confidence:double, track_id:chararray, year:int, similar_artists:chararray, artist_terms:chararray, artist_terms_freq:chararray, artist_terms_weight:chararray);


SEGMENTS_STRT = LOAD '/user/maria_dev/music/segmentsstrt.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, segments_start:chararray);

JN_RE_SEG_STRT = JOIN TR_AT BY track_id, SEGMENTS_STRT BY track_id;

RE_SEG_STRT  = FOREACH JN_RE_SEG_STRT GENERATE TR_AT::artist_id AS artist_id, TR_AT::artists_mb_id AS artists_mb_id, TR_AT::artist_playmeid AS artist_playmeid, TR_AT::artist_7digitalid AS artist_7digitalid, TR_AT::artist_familarity AS artist_familarity, TR_AT::artist_name AS artist_name, TR_AT::artist_hotttnesss AS artist_hotttnesss, TR_AT::artist_location AS artist_location, TR_AT::release AS release, TR_AT::release_7digitalid AS release_7digitalid, TR_AT::song_id AS song_id, TR_AT::title AS title, TR_AT::song_hotttnesss AS song_hotttnesss, TR_AT::track_7digitalid AS track_7digitalid, TR_AT::analysis_sample_rate AS analysis_sample_rate, TR_AT::audio_md5 AS audio_md5, TR_AT::duration AS duration, TR_AT::end_of_fade_in AS end_of_fade_in, TR_AT::energy AS energy, TR_AT::key AS key, TR_AT::key_confidence AS key_confidence, TR_AT::loudness AS loudness, TR_AT::mode AS mode, TR_AT::mode_confidence AS mode_confidence, TR_AT::start_of_fade_out AS start_of_fade_out, TR_AT::tempo AS tempo, TR_AT::time_signature AS time_signature, TR_AT::time_signature_confidence AS time_signature_confidence, TR_AT::track_id AS track_id, TR_AT::year AS year, TR_AT::similar_artists AS similar_artists, TR_AT::artist_terms AS artist_terms, TR_AT::artist_terms_freq AS artist_terms_freq, TR_AT::artist_terms_weight AS artist_terms_weight, SEGMENTS_STRT::segments_start AS segments_start;

STORE RE_SEG_STRT into '/user/maria_dev/project_output/RE_SEG_STRT/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

SEG_STRT = LOAD '/user/maria_dev/project_output/RE_SEG_STRT/*' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artists_mb_id: chararray, artist_playmeid: int, artist_7digitalid:int, artist_familarity:double, artist_name:chararray, artist_hotttnesss:double, artist_location:chararray, release:chararray, release_7digitalid:int, song_id:chararray, title:chararray, song_hotttnesss:double, track_7digitalid:int, analysis_sample_rate:int, audio_md5:chararray, duration:int, end_of_fade_in:double, energy:int, key:int, key_confidence:double, loudness:double, mode:int, mode_confidence:double, start_of_fade_out:double, tempo:double, time_signature:double, time_signature_confidence:double, track_id:chararray, year:int, similar_artists:chararray, artist_terms:chararray, artist_terms_freq:chararray, artist_terms_weight:chararray, segments_start:chararray);

SEGMENTS_TONE = LOAD '/user/maria_dev/music/segmentstone.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, segments_confidence:chararray, segments_pitches:chararray, segments_timbre:chararray);

JN_RE_SEG_TONE = JOIN SEG_STRT BY track_id, SEGMENTS_TONE BY track_id;

RE_SEG_TONE = FOREACH JN_RE_SEG_TONE GENERATE SEG_STRT::artist_id AS artist_id, SEG_STRT::artists_mb_id AS artists_mb_id, SEG_STRT::artist_playmeid AS artist_playmeid, SEG_STRT::artist_7digitalid AS artist_7digitalid, SEG_STRT::artist_familarity AS artist_familarity, SEG_STRT::artist_name AS artist_name, SEG_STRT::artist_hotttnesss AS artist_hotttnesss, SEG_STRT::artist_location AS artist_location, SEG_STRT::release AS release, SEG_STRT::release_7digitalid AS release_7digitalid, SEG_STRT::song_id AS song_id, SEG_STRT::title AS title, SEG_STRT::song_hotttnesss AS song_hotttnesss, SEG_STRT::track_7digitalid AS track_7digitalid, SEG_STRT::analysis_sample_rate AS analysis_sample_rate, SEG_STRT::audio_md5 AS audio_md5, SEG_STRT::duration AS duration, SEG_STRT::end_of_fade_in AS end_of_fade_in, SEG_STRT::energy AS energy, SEG_STRT::key AS key, SEG_STRT::key_confidence AS key_confidence, SEG_STRT::loudness AS loudness, SEG_STRT::mode AS mode, SEG_STRT::mode_confidence AS mode_confidence, SEG_STRT::start_of_fade_out AS start_of_fade_out, SEG_STRT::tempo AS tempo, SEG_STRT::time_signature AS time_signature, SEG_STRT::time_signature_confidence AS time_signature_confidence, SEG_STRT::track_id AS track_id, SEG_STRT::year AS year, SEG_STRT::similar_artists AS similar_artists, SEG_STRT::artist_terms AS artist_terms, SEG_STRT::artist_terms_freq AS artist_terms_freq, SEG_STRT::artist_terms_weight AS artist_terms_weight, SEG_STRT::segments_start AS segments_start, SEGMENTS_TONE::segments_confidence AS segments_confidence, SEGMENTS_TONE::segments_pitches AS segments_pitches, SEGMENTS_TONE::segments_timbre AS segments_timbre;

STORE RE_SEG_TONE into '/user/maria_dev/project_output/RE_SEG_TONE/' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE');

SEG_TONE = LOAD '/user/maria_dev/project_output/RE_SEG_TONE/*' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artists_mb_id: chararray, artist_playmeid: int, artist_7digitalid:int, artist_familarity:double, artist_name:chararray, artist_hotttnesss:double, artist_location:chararray, release:chararray, release_7digitalid:int, song_id:chararray, title:chararray, song_hotttnesss:double, track_7digitalid:int, analysis_sample_rate:int, audio_md5:chararray, duration:int, end_of_fade_in:double, energy:int, key:int, key_confidence:double, loudness:double, mode:int, mode_confidence:double, start_of_fade_out:double, tempo:double, time_signature:double, time_signature_confidence:double, track_id:chararray, year:int, similar_artists:chararray, artist_terms:chararray, artist_terms_freq:chararray, artist_terms_weight:chararray, segments_start:chararray, segments_confidence:chararray, segments_pitches:chararray, segments_timbre:chararray);


SEGMENTS_LOUD = LOAD '/user/maria_dev/music/segmentsloud.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, segments_loudness_max:chararray, segments_loudness_max_time:chararray, segments_loudness_start:chararray);

JN_RE_SEG_LOUD = JOIN SEG_TONE BY track_id, SEGMENTS_LOUD BY track_id;

SEG_LOUD = FOREACH JN_RE_SEG_LOUD GENERATE SEG_TONE::artist_id AS artist_id, SEG_TONE::artists_mb_id AS artists_mb_id, SEG_TONE::artist_playmeid AS artist_playmeid, SEG_TONE::artist_7digitalid AS artist_7digitalid, SEG_TONE::artist_familarity AS artist_familarity, SEG_TONE::artist_name AS artist_name, SEG_TONE::artist_hotttnesss AS artist_hotttnesss, SEG_TONE::artist_location AS artist_location, SEG_TONE::release AS release, SEG_TONE::release_7digitalid AS release_7digitalid, SEG_TONE::song_id AS song_id, SEG_TONE::title AS title, SEG_TONE::song_hotttnesss AS song_hotttnesss, SEG_TONE::track_7digitalid AS track_7digitalid, SEG_TONE::analysis_sample_rate AS analysis_sample_rate, SEG_TONE::audio_md5 AS audio_md5, SEG_TONE::duration AS duration, SEG_TONE::end_of_fade_in AS end_of_fade_in, SEG_TONE::energy AS energy, SEG_TONE::key AS key, SEG_TONE::key_confidence AS key_confidence, SEG_TONE::loudness AS loudness, SEG_TONE::mode AS mode, SEG_TONE::mode_confidence AS mode_confidence, SEG_TONE::start_of_fade_out AS start_of_fade_out, SEG_TONE::tempo AS tempo, SEG_TONE::time_signature AS time_signature, SEG_TONE::time_signature_confidence AS time_signature_confidence, SEG_TONE::track_id AS track_id, SEG_TONE::year AS year, SEG_TONE::similar_artists AS similar_artists, SEG_TONE::artist_terms AS artist_terms, SEG_TONE::artist_terms_freq AS artist_terms_freq, SEG_TONE::artist_terms_weight AS artist_terms_weight, SEG_TONE::segments_start AS segments_start, SEG_TONE::segments_confidence AS segments_confidence, SEG_TONE::segments_pitches AS segments_pitches, SEG_TONE::segments_timbre AS segments_timbre, SEGMENTS_LOUD::segments_loudness_max AS segments_loudness_max, SEGMENTS_LOUD::segments_loudness_max_time AS segments_loudness_max_time, SEGMENTS_LOUD::segments_loudness_start AS segments_loudness_start;

SECTIONS = LOAD '/user/maria_dev/music/sections.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, sections_start:chararray, sections_confidence:chararray);


JN_TR_SECTIONS = JOIN SEG_LOUD BY track_id, SECTIONS BY track_id;

RE_TR_SECTIONS = FOREACH JN_TR_SECTIONS GENERATE SEG_LOUD::artist_id AS artist_id, SEG_LOUD::artists_mb_id AS artists_mb_id, SEG_LOUD::artist_playmeid AS artist_playmeid, SEG_LOUD::artist_7digitalid AS artist_7digitalid, SEG_LOUD::artist_familarity AS artist_familarity, SEG_LOUD::artist_name AS artist_name, SEG_LOUD::artist_hotttnesss AS artist_hotttnesss, SEG_LOUD::artist_location AS artist_location, SEG_LOUD::release AS release, SEG_LOUD::release_7digitalid AS release_7digitalid, SEG_LOUD::song_id AS song_id, SEG_LOUD::title AS title, SEG_LOUD::song_hotttnesss AS song_hotttnesss, SEG_LOUD::track_7digitalid AS track_7digitalid, SEG_LOUD::analysis_sample_rate AS analysis_sample_rate, SEG_LOUD::audio_md5 AS audio_md5, SEG_LOUD::duration AS duration, SEG_LOUD::end_of_fade_in AS end_of_fade_in, SEG_LOUD::energy AS energy, SEG_LOUD::key AS key, SEG_LOUD::key_confidence AS key_confidence, SEG_LOUD::loudness AS loudness, SEG_LOUD::mode AS mode, SEG_LOUD::mode_confidence AS mode_confidence, SEG_LOUD::start_of_fade_out AS start_of_fade_out, SEG_LOUD::tempo AS tempo, SEG_LOUD::time_signature AS time_signature, SEG_LOUD::time_signature_confidence AS time_signature_confidence, SEG_LOUD::track_id AS track_id, SEG_LOUD::year AS year, SEG_LOUD::similar_artists AS similar_artists, SEG_LOUD::artist_terms AS artist_terms, SEG_LOUD::artist_terms_freq AS artist_terms_freq, SEG_LOUD::artist_terms_weight AS artist_terms_weight, SEG_LOUD::segments_start AS segments_start, SEG_LOUD::segments_confidence AS segments_confidence, SEG_LOUD::segments_pitches AS segments_pitches, SEG_LOUD::segments_timbre AS segments_timbre, SEG_LOUD::segments_loudness_max AS segments_loudness_max, SEG_LOUD::segments_loudness_max_time AS segments_loudness_max_time, SEG_LOUD::segments_loudness_start AS segments_loudness_start, SECTIONS::sections_start AS sections_start, SECTIONS::sections_confidence AS sections_confidence;

BEATS = LOAD '/user/maria_dev/music/beats.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, beats_start:chararray, beats_confidence:chararray);

JN_TR_BEATS = JOIN RE_TR_SECTIONS BY track_id, BEATS by track_id;

TR_BEATS = FOREACH JN_TR_BEATS GENERATE RE_TR_SECTIONS::artist_id AS artist_id, RE_TR_SECTIONS::artists_mb_id AS artists_mb_id, RE_TR_SECTIONS::artist_playmeid AS artist_playmeid, RE_TR_SECTIONS::artist_7digitalid AS artist_7digitalid, RE_TR_SECTIONS::artist_familarity AS artist_familarity, RE_TR_SECTIONS::artist_name AS artist_name, RE_TR_SECTIONS::artist_hotttnesss AS artist_hotttnesss, RE_TR_SECTIONS::artist_location AS artist_location, RE_TR_SECTIONS::release AS release, RE_TR_SECTIONS::release_7digitalid AS release_7digitalid, RE_TR_SECTIONS::song_id AS song_id, RE_TR_SECTIONS::title AS title, RE_TR_SECTIONS::song_hotttnesss AS song_hotttnesss, RE_TR_SECTIONS::track_7digitalid AS track_7digitalid, RE_TR_SECTIONS::analysis_sample_rate AS analysis_sample_rate, RE_TR_SECTIONS::audio_md5 AS audio_md5, RE_TR_SECTIONS::duration AS duration, RE_TR_SECTIONS::end_of_fade_in AS end_of_fade_in, RE_TR_SECTIONS::energy AS energy, RE_TR_SECTIONS::key AS key, RE_TR_SECTIONS::key_confidence AS key_confidence, RE_TR_SECTIONS::loudness AS loudness, RE_TR_SECTIONS::mode AS mode, RE_TR_SECTIONS::mode_confidence AS mode_confidence, RE_TR_SECTIONS::start_of_fade_out AS start_of_fade_out, RE_TR_SECTIONS::tempo AS tempo, RE_TR_SECTIONS::time_signature AS time_signature, RE_TR_SECTIONS::time_signature_confidence AS time_signature_confidence, RE_TR_SECTIONS::track_id AS track_id, RE_TR_SECTIONS::year AS year, RE_TR_SECTIONS::similar_artists AS similar_artists, RE_TR_SECTIONS::artist_terms AS artist_terms, RE_TR_SECTIONS::artist_terms_freq AS artist_terms_freq, RE_TR_SECTIONS::artist_terms_weight AS artist_terms_weight, RE_TR_SECTIONS::segments_start AS segments_start, RE_TR_SECTIONS::segments_confidence AS segments_confidence, RE_TR_SECTIONS::segments_pitches AS segments_pitches, RE_TR_SECTIONS::segments_timbre AS segments_timbre, RE_TR_SECTIONS::segments_loudness_max AS segments_loudness_max, RE_TR_SECTIONS::segments_loudness_max_time AS segments_loudness_max_time, RE_TR_SECTIONS::segments_loudness_start AS segments_loudness_start, RE_TR_SECTIONS::sections_start AS sections_start, RE_TR_SECTIONS::sections_confidence AS sections_confidence, BEATS::beats_start AS beats_start, BEATS::beats_confidence AS beats_confidence;


BARS = LOAD '/user/maria_dev/music/bars.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, bars_start:chararray, bars_confidence:chararray);

JN_TR_BARS = JOIN TR_BEATS BY track_id, BARS BY track_id;

TR_BARS = FOREACH JN_TR_BARS GENERATE TR_BEATS::artist_id AS artist_id, TR_BEATS::artists_mb_id AS artists_mb_id, TR_BEATS::artist_playmeid AS artist_playmeid, TR_BEATS::artist_7digitalid AS artist_7digitalid, TR_BEATS::artist_familarity AS artist_familarity, TR_BEATS::artist_name AS artist_name, TR_BEATS::artist_hotttnesss AS artist_hotttnesss, TR_BEATS::artist_location AS artist_location, TR_BEATS::release AS release, TR_BEATS::release_7digitalid AS release_7digitalid, TR_BEATS::song_id AS song_id, TR_BEATS::title AS title, TR_BEATS::song_hotttnesss AS song_hotttnesss, TR_BEATS::track_7digitalid AS track_7digitalid, TR_BEATS::analysis_sample_rate AS analysis_sample_rate, TR_BEATS::audio_md5 AS audio_md5, TR_BEATS::duration AS duration, TR_BEATS::end_of_fade_in AS end_of_fade_in, TR_BEATS::energy AS energy, TR_BEATS::key AS key, TR_BEATS::key_confidence AS key_confidence, TR_BEATS::loudness AS loudness, TR_BEATS::mode AS mode, TR_BEATS::mode_confidence AS mode_confidence, TR_BEATS::start_of_fade_out AS start_of_fade_out, TR_BEATS::tempo AS tempo, TR_BEATS::time_signature AS time_signature, TR_BEATS::time_signature_confidence AS time_signature_confidence, TR_BEATS::track_id AS track_id, TR_BEATS::year AS year, TR_BEATS::similar_artists AS similar_artists, TR_BEATS::artist_terms AS artist_terms, TR_BEATS::artist_terms_freq AS artist_terms_freq, TR_BEATS::artist_terms_weight AS artist_terms_weight, TR_BEATS::segments_start AS segments_start, TR_BEATS::segments_confidence AS segments_confidence, TR_BEATS::segments_pitches AS segments_pitches, TR_BEATS::segments_timbre AS segments_timbre, TR_BEATS::segments_loudness_max AS segments_loudness_max, TR_BEATS::segments_loudness_max_time AS segments_loudness_max_time, TR_BEATS::segments_loudness_start AS segments_loudness_start, TR_BEATS::sections_start AS sections_start, TR_BEATS::sections_confidence AS sections_confidence, TR_BEATS::beats_start AS beats_start, TR_BEATS::beats_confidence AS beats_confidence, BARS::bars_start AS bars_start, BARS::bars_confidence AS bars_confidence;


TATUMS = LOAD '/user/maria_dev/music/tatums.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (track_id: chararray, tatums_start:chararray, tatums_confidence:chararray);

JN_TR_TATUMS = JOIN TR_BARS BY track_id, TATUMS BY track_id;

TR_TATUMS = FOREACH JN_TR_TATUMS GENERATE TR_BARS::artist_id AS artist_id, TR_BARS::artists_mb_id AS artists_mb_id, TR_BARS::artist_playmeid AS artist_playmeid, TR_BARS::artist_7digitalid AS artist_7digitalid, TR_BARS::artist_familarity AS artist_familarity, TR_BARS::artist_name AS artist_name, TR_BARS::artist_hotttnesss AS artist_hotttnesss, TR_BARS::artist_location AS artist_location, TR_BARS::release AS release, TR_BARS::release_7digitalid AS release_7digitalid, TR_BARS::song_id AS song_id, TR_BARS::title AS title, TR_BARS::song_hotttnesss AS song_hotttnesss, TR_BARS::track_7digitalid AS track_7digitalid, TR_BARS::analysis_sample_rate AS analysis_sample_rate, TR_BARS::audio_md5 AS audio_md5, TR_BARS::duration AS duration, TR_BARS::end_of_fade_in AS end_of_fade_in, TR_BARS::energy AS energy, TR_BARS::key AS key, TR_BARS::key_confidence AS key_confidence, TR_BARS::loudness AS loudness, TR_BARS::mode AS mode, TR_BARS::mode_confidence AS mode_confidence, TR_BARS::start_of_fade_out AS start_of_fade_out, TR_BARS::tempo AS tempo, TR_BARS::time_signature AS time_signature, TR_BARS::time_signature_confidence AS time_signature_confidence, TR_BARS::track_id AS track_id, TR_BARS::year AS year, TR_BARS::similar_artists AS similar_artists, TR_BARS::artist_terms AS artist_terms, TR_BARS::artist_terms_freq AS artist_terms_freq, TR_BARS::artist_terms_weight AS artist_terms_weight, TR_BARS::segments_start AS segments_start, TR_BARS::segments_confidence AS segments_confidence, TR_BARS::segments_pitches AS segments_pitches, TR_BARS::segments_timbre AS segments_timbre, TR_BARS::segments_loudness_max AS segments_loudness_max, TR_BARS::segments_loudness_max_time AS segments_loudness_max_time, TR_BARS::segments_loudness_start AS segments_loudness_start, TR_BARS::sections_start AS sections_start, TR_BARS::sections_confidence AS sections_confidence, TR_BARS::beats_start AS beats_start, TR_BARS::beats_confidence AS beats_confidence, TR_BARS::bars_start AS bars_start, TR_BARS::bars_confidence AS bars_confidence, TATUMS::tatums_start AS tatums_start, TATUMS::tatums_confidence AS tatums_confidence;


MBTAGS = LOAD '/user/maria_dev/music/mbtags.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE') AS (artist_id: chararray, artist_mbtags:chararray, artist_mbtags_count:chararray);

DISTINCT_MBTAGS = DISTINCT MBTAGS;

JN_TR_MBTAGS = JOIN TR_TATUMS BY artist_id, DISTINCT_MBTAGS by artist_id;


TR_MBTAGS = FOREACH JN_TR_MBTAGS GENERATE TR_TATUMS::artist_id AS artist_id, TR_TATUMS::artists_mb_id AS artists_mb_id, TR_TATUMS::artist_playmeid AS artist_playmeid, TR_TATUMS::artist_7digitalid AS artist_7digitalid, TR_TATUMS::artist_familarity AS artist_familarity, TR_TATUMS::artist_name AS artist_name, TR_TATUMS::artist_hotttnesss AS artist_hotttnesss, TR_TATUMS::artist_location AS artist_location, TR_TATUMS::similar_artists AS similar_artists, TR_TATUMS::artist_terms AS artist_terms, TR_TATUMS::artist_terms_freq AS artist_terms_freq, TR_TATUMS::artist_terms_weight AS artist_terms_weight, DISTINCT_MBTAGS::artist_mbtags AS artist_mbtags, DISTINCT_MBTAGS::artist_mbtags_count AS artist_mbtags_count, TR_TATUMS::release AS release, TR_TATUMS::release_7digitalid AS release_7digitalid, TR_TATUMS::song_id AS song_id, TR_TATUMS::title AS title, TR_TATUMS::song_hotttnesss AS song_hotttnesss, TR_TATUMS::track_7digitalid AS track_7digitalid, TR_TATUMS::analysis_sample_rate AS analysis_sample_rate, TR_TATUMS::audio_md5 AS audio_md5, TR_TATUMS::duration AS duration, TR_TATUMS::end_of_fade_in AS end_of_fade_in, TR_TATUMS::energy AS energy, TR_TATUMS::key AS key, TR_TATUMS::key_confidence AS key_confidence, TR_TATUMS::loudness AS loudness, TR_TATUMS::mode AS mode, TR_TATUMS::mode_confidence AS mode_confidence, TR_TATUMS::start_of_fade_out AS start_of_fade_out, TR_TATUMS::tempo AS tempo, TR_TATUMS::time_signature AS time_signature, TR_TATUMS::time_signature_confidence AS time_signature_confidence, TR_TATUMS::track_id AS track_id, TR_TATUMS::year AS year,TR_TATUMS::segments_start AS segments_start, TR_TATUMS::segments_confidence AS segments_confidence, TR_TATUMS::segments_pitches AS segments_pitches, TR_TATUMS::segments_timbre AS segments_timbre, TR_TATUMS::segments_loudness_max AS segments_loudness_max, TR_TATUMS::segments_loudness_max_time AS segments_loudness_max_time, TR_TATUMS::segments_loudness_start AS segments_loudness_start, TR_TATUMS::sections_start AS sections_start, TR_TATUMS::sections_confidence AS sections_confidence, TR_TATUMS::beats_start AS beats_start, TR_TATUMS::beats_confidence AS beats_confidence, TR_TATUMS::bars_start AS bars_start, TR_TATUMS::bars_confidence AS bars_confidence, TR_TATUMS::tatums_start AS tatums_start, TR_TATUMS::tatums_confidence AS tatums_confidence;

A = FOREACH TR_MBTAGS GENERATE track_id AS track_id, artist_id AS artist_id, artists_mb_id AS artists_mb_id, artist_playmeid AS artist_playmeid, artist_7digitalid AS artist_7digitalid, artist_familarity AS artist_familarity, artist_name AS artist_name, artist_hotttnesss AS artist_hotttnesss, artist_location AS artist_location, similar_artists AS similar_artists, beats_start AS beats_start, beats_confidence AS beats_confidence, segments_start AS segments_start, segments_confidence AS segments_confidence;

STORE A INTO 'hbase://modelx1' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('artist_details:artist_id, artist_details:artist_mb_id, artist_details:artist_playmeid, artist_details:artist_7digitalid, artist_details:artist_familarity, artist_details:artist_name, artist_details:artist_hotttnesss, artist_details:artist_location, artist_details:similar_artists, track_details:beats_start, track_details:beats_confidence, track_details:segments_start, track_details:segments_confidence');

B = FOREACH TR_MBTAGS GENERATE track_id AS track_id, artist_terms AS artist_terms, artist_terms_freq AS artist_terms_freq, artist_terms_weight AS artist_terms_weight, artist_mbtags AS artist_mbtags, artist_mbtags_count AS artist_mbtags_count, release AS release, release_7digitalid AS release_7digitalid, song_id AS song_id, title AS title;

STORE B INTO 'hbase://modelx1' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('artist_details:artist_terms, artist_details:artist_terms_freq, artist_details:artist_terms_weight, artist_details:artist_mbtags, artist_details:artist_mbtags_count, track_details:release, track_details:release_7digitalid, track_details:song_id, track_details:title');

C = FOREACH TR_MBTAGS GENERATE track_id AS track_id, tatums_start AS tatums_start, tatums_confidence AS tatums_confidence, bars_start AS bars_start, bars_confidence AS bars_confidence, sections_confidence AS sections_confidence, sections_start AS sections_start, segments_loudness_max AS segments_loudness_max, segments_loudness_max_time AS segments_loudness_max_time, segments_loudness_start AS segments_loudness_start, segments_timbre AS segments_timbre, segments_pitches AS segments_pitches;

STORE C INTO 'hbase://modelx1' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('track_details:tatums_start, track_details:tatums_confidence, track_details:bars_start, track_details:bars_confidence, track_details:sections_confidence, track_details:sections_start, track_details:segments_loudness_max, track_details:segments_loudness_max_time, track_details:segments_loudness_start, track_details:segments_timbre, track_details:segments_pitches');

D = FOREACH TR_MBTAGS GENERATE track_id AS track_id, song_hotttnesss AS song_hotttnesss, duration AS duration, end_of_fade_in AS end_of_fade_in, energy AS energy, track_7digitalid AS track_7digitalid, analysis_sample_rate AS analysis_sample_rate, audio_md5 AS audio_md5, key AS key, key_confidence AS key_confidence, loudness AS loudness, mode AS mode, mode_confidence AS mode_confidence, start_of_fade_out AS start_of_fade_out, tempo AS tempo, time_signature AS time_signature, time_signature_confidence AS time_signature_confidence, year AS year;

STORE D INTO 'hbase://modelx1' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('track_details:song_hotttnesss, track_details:duration, track_details:end_of_fade_in, track_details:energy, track_details:track_7digitalid, track_details:analysis_sample_rate, track_details:audio_md5, track_details:key, track_details:key_confidence, track_details:loudness, track_details:mode, track_details:mode_confidence, track_details:start_of_fade_out, track_details:tempo, track_details:time_signature, track_details:time_signature_confidence, track_details:year');
