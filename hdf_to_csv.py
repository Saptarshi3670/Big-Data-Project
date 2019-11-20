import h5py as h5
import hdf5_getters
import os
import csv
import numpy as np


files = '/Users/saptarshimaiti/Downloads/MillionSongSubset/data/'

csvTracksFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/TRACKS.csv'
csvSimilarArtistFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/similar_artists.csv'
csvArtistTermsFile='/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/artist_terms.csv'
csvSegmentsStrtFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/segmentsstrt.csv'
csvSegmentsToneFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/segmentstone.csv'
csvSegmentsLoudFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/segmentsloud.csv'
csvSectionsFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/sections.csv'
csvBeatsFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/beats.csv'
csvBarsFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/bars.csv'
csvTatumsFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/tatums.csv'
csvMBTagsFile = '/Users/saptarshimaiti/Desktop/Big Data technologies/Project/music/mbtags.csv'

##Splitting and Converting hdf files into multiple csv files
with open(csvTracksFile, "w") as outputTracks, open(csvSimilarArtistFile, "w") as outputSimilarArtists, open(csvArtistTermsFile, "w") as outputArtistTermsFile, open(csvSegmentsStrtFile, "w") as outputSegmentsStrtFile, open(csvSegmentsToneFile, "w") as outputSegmentsToneFile, open(csvSegmentsLoudFile, "w") as outputSegmentsLoudFile, open(csvSectionsFile, "w") as outputSectionsFile, open(csvBeatsFile, "w") as outputBeatsFile, open(csvBarsFile, "w") as outputBarsFile, open(csvTatumsFile, "w") as outputTatumsFile, open(csvMBTagsFile, "w") as outputMBTagsFile:
	writer_tracks = csv.writer(outputTracks, lineterminator='\n')
	writer_similar_artists = csv.writer(outputSimilarArtists, lineterminator='\n')
	writer_artist_terms = csv.writer(outputArtistTermsFile, lineterminator='\n')
	writer_segments_strt_file = csv.writer(outputSegmentsStrtFile, lineterminator='\n')
	writer_segments_tone_file = csv.writer(outputSegmentsToneFile, lineterminator='\n')
	writer_segments_loud_file = csv.writer(outputSegmentsLoudFile, lineterminator='\n')
	writer_sections_file= csv.writer(outputSectionsFile, lineterminator='\n')
	writer_beats_file = csv.writer(outputBeatsFile, lineterminator='\n')
	writer_bars_file = csv.writer(outputBarsFile, lineterminator='\n')
	writer_tatums_file = csv.writer(outputTatumsFile, lineterminator='\n')
	writer_MBTags_File = csv.writer(outputMBTagsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				hdf = hdf5_getters.open_h5_file_read(dirname + '/' + filename)
				artist_id = hdf5_getters.get_artist_id(hdf)
				artists_mb_id = hdf5_getters.get_artist_mbid(hdf)
				artist_playmeid = hdf5_getters.get_artist_playmeid(hdf)
				artist_7digitalid = hdf5_getters.get_artist_7digitalid(hdf)
				artist_name = hdf5_getters.get_artist_name(hdf)
				artist_familarity = hdf5_getters.get_artist_familiarity(hdf)
				artist_hotttnesss = hdf5_getters.get_artist_hotttnesss(hdf)
				artist_location = hdf5_getters.get_artist_location(hdf)
				release = hdf5_getters.get_release(hdf)
				release_7digitalid = hdf5_getters.get_release_7digitalid(hdf)
				song_id = hdf5_getters.get_song_id(hdf)
				title = hdf5_getters.get_title(hdf)
				song_hotttnesss = hdf5_getters.get_song_hotttnesss(hdf)
				track_7digitalid = hdf5_getters.get_track_7digitalid(hdf)
				analysis_sample_rate = hdf5_getters.get_analysis_sample_rate(hdf)
				audio_md5 = hdf5_getters.get_audio_md5(hdf)
				duration = hdf5_getters.get_duration(hdf)
				end_of_fade_in = hdf5_getters.get_end_of_fade_in(hdf)
				energy = hdf5_getters.get_energy(hdf)
				key = hdf5_getters.get_key(hdf)
				key_confidence = hdf5_getters.get_key_confidence(hdf)
				loudness = hdf5_getters.get_loudness(hdf)
				mode = hdf5_getters.get_mode(hdf)
				mode_confidence = hdf5_getters.get_mode_confidence(hdf)
				start_of_fade_out = hdf5_getters.get_start_of_fade_out(hdf)
				tempo = hdf5_getters.get_tempo(hdf)
				time_signature = hdf5_getters.get_time_signature(hdf)
				time_signature_confidence = hdf5_getters.get_time_signature_confidence(hdf)
				track_id = hdf5_getters.get_track_id(hdf)
				year = hdf5_getters.get_year(hdf)

				similar_artists = hdf5_getters.get_similar_artists(hdf)

				artist_terms = hdf5_getters.get_artist_terms(hdf)
				artist_terms_freq = hdf5_getters.get_artist_terms_freq(hdf)
				artist_terms_weight = hdf5_getters.get_artist_terms_weight(hdf)

				segments_start = hdf5_getters.get_segments_start(hdf)

				segments_confidence = hdf5_getters.get_segments_confidence(hdf)
				segments_pitches = hdf5_getters.get_segments_pitches(hdf)
				segments_timbre = hdf5_getters.get_segments_timbre(hdf)

				segments_loudness_max = hdf5_getters.get_segments_loudness_max(hdf)
				segments_loudness_max_time = hdf5_getters.get_segments_loudness_max_time(hdf)
				segments_loudness_start = hdf5_getters.get_segments_loudness_start(hdf)

				sections_start = hdf5_getters.get_sections_start(hdf)
				sections_confidence = hdf5_getters.get_sections_confidence(hdf)

				beats_start = hdf5_getters.get_beats_start(hdf)
				beats_confidence = hdf5_getters.get_beats_confidence(hdf)

				bars_start = hdf5_getters.get_bars_start(hdf)
				bars_confidence = hdf5_getters.get_bars_confidence(hdf)

				tatums_start = hdf5_getters.get_tatums_start(hdf)
				tatums_confidence = hdf5_getters.get_tatums_confidence(hdf)

				artist_mbtags = hdf5_getters.get_artist_mbtags(hdf)
				artist_mbtags_count = hdf5_getters.get_artist_mbtags_count(hdf)

				trList = [artist_id.decode(), artists_mb_id.decode(), artist_playmeid, artist_7digitalid, artist_familarity, artist_name.decode(), artist_hotttnesss, artist_location.decode(), release.decode(), release_7digitalid, song_id.decode(), title.decode(), song_hotttnesss, track_7digitalid, analysis_sample_rate, audio_md5.decode(), duration, end_of_fade_in, energy, key, key_confidence, loudness, mode, mode_confidence, start_of_fade_out, tempo, time_signature, time_signature_confidence, track_id.decode(), year ]
				writer_tracks.writerow(trList)

				trList = [artist_id.decode(), track_id.decode(), np.array([x.decode() for x in similar_artists]) ]
				writer_similar_artists.writerow(trList)

				trList = [artist_id.decode(), np.array([x.decode() for x in artist_terms]),artist_terms_freq, artist_terms_weight]
				writer_artist_terms.writerow(trList)

				trList = [track_id.decode(),segments_start]
				writer_segments_strt_file.writerow(trList)

				trList = [track_id.decode(),segments_confidence, segments_pitches, segments_timbre]
				writer_segments_tone_file.writerow(trList)

				trList = [track_id.decode(),segments_loudness_max, segments_loudness_max_time, segments_loudness_start]
				writer_segments_loud_file.writerow(trList)

				trList = [track_id.decode(), sections_start, sections_confidence]
				writer_sections_file.writerow(trList)

				trList = [track_id.decode(), beats_start, beats_confidence]
				writer_beats_file.writerow(trList)

				trList = [track_id.decode(), bars_start, bars_confidence]
				writer_bars_file.writerow(trList)

				trList = [track_id.decode(), tatums_start, tatums_confidence]
				writer_tatums_file.writerow(trList)

				trList = [artist_id.decode(), np.array([x.decode() for x in artist_mbtags]), artist_mbtags_count]
				writer_MBTags_File.writerow(trList)


				hdf.close()
#os.close(outputTracks)
	
'''

with open(csvSimilarArtistFile, "w") as outputSimilarArtists:
	writer_similar_artists = csv.writer(outputSimilarArtists, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				artist_id = hdf5_getters.get_artist_id(hdf)
				similar_artists = hdf5_getters.get_similar_artists(hdf)
				
				trList = [artist_id.decode(), np.array([x.decode() for x in similar_artists]) ]

				writer_similar_artists.writerow(trList)
				hdf.close()
os.close(outputSimilarArtists)
	


with open(csvArtistTermsFile, "w") as outputArtistTermsFile:
	writer_artist_terms = csv.writer(outputArtistTermsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				artist_id = hdf5_getters.get_artist_id(hdf)
				artist_terms = hdf5_getters.get_artist_terms(hdf)
				artist_terms_freq = hdf5_getters.get_artist_terms_freq(hdf)
				artist_terms_weight = hdf5_getters.get_artist_terms_weight(hdf)
				
				trList = [artist_id.decode(), np.array([x.decode() for x in artist_terms]),artist_terms_freq, artist_terms_weight]

				writer_artist_terms.writerow(trList)
				hdf.close()



with open(csvSegmentsFile, "w") as outputSegmentsFile:
	writer_segments_file = csv.writer(outputSegmentsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				track_id = hdf5_getters.get_track_id(hdf)
				segments_start = hdf5_getters.get_segments_start(hdf)
				segments_confidence = hdf5_getters.get_segments_confidence(hdf)
				segments_pitches = hdf5_getters.get_segments_pitches(hdf)
				segments_timbre = hdf5_getters.get_segments_timbre(hdf)
				segments_loudness_max = hdf5_getters.get_segments_loudness_max(hdf)
				segments_loudness_max_time = hdf5_getters.get_segments_loudness_max_time(hdf)
				segments_loudness_start = hdf5_getters.get_segments_loudness_start(hdf)
				
				trList = [track_id.decode(), segments_start, segments_confidence, segments_pitches, segments_timbre, segments_loudness_max, segments_loudness_max_time, segments_loudness_start]

				writer_segments_file.writerow(trList)
				hdf.close()



with open(csvSectionsFile, "w") as outputSectionsFile:
	writer_sections_file= csv.writer(outputSectionsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				track_id = hdf5_getters.get_track_id(hdf)
				sections_start = hdf5_getters.get_sections_start(hdf)
				sections_confidence = hdf5_getters.get_sections_confidence(hdf)
				
				trList = [track_id.decode(), sections_start, sections_confidence]

				writer_sections_file.writerow(trList)
				hdf.close()
output.close()


with open(csvBeatsFile, "w") as outputBeatsFile:
	writer_beats_file = csv.writer(outputBeatsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				track_id = hdf5_getters.get_track_id(hdf)
				beats_start = hdf5_getters.get_beats_start(hdf)
				beats_confidence = hdf5_getters.get_beats_confidence(hdf)
				
				trList = [track_id.decode(), beats_start, beats_confidence]

				writer_beats_file.writerow(trList)
				hdf.close()
output.close()


with open(csvBarsFile, "w") as outputBarsFile:
	writer_bars_file = csv.writer(outputBarsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				track_id = hdf5_getters.get_track_id(hdf)
				bars_start = hdf5_getters.get_bars_start(hdf)
				bars_confidence = hdf5_getters.get_bars_confidence(hdf)
				
				trList = [track_id.decode(), bars_start, bars_confidence]

				writer_bars_file.writerow(trList)
				hdf.close()
output.close()



with open(csvTatumsFile, "w") as outputTatumsFile:
	writer_tatums_file = csv.writer(outputTatumsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				track_id = hdf5_getters.get_track_id(hdf)
				tatums_start = hdf5_getters.get_tatums_start(hdf)
				tatums_confidence = hdf5_getters.get_tatums_confidence(hdf)
				
				trList = [track_id.decode(), tatums_start, tatums_confidence]

				writer_tatums_file.writerow(trList)
				hdf.close()
output.close()


with open(csvMBTagsFile, "w") as outputMBTagsFile:
	writer_MBTags_File = csv.writer(outputMBTagsFile, lineterminator='\n')
	for dirname, dirs, files in os.walk(files):
		for filename in files:
			filename_without_extension, extension = os.path.splitext(filename)
			if extension == '.h5':
				artist_id = hdf5_getters.get_artist_id(hdf)
				artist_mbtags = hdf5_getters.get_artist_mbtags(hdf)
				artist_mbtags_count = hdf5_getters.get_artist_mbtags_count(hdf)
				
				trList = [artist_id.decode(), np.array([x.decode() for x in artist_mbtags]), artist_mbtags_count]

				writer_MBTags_File.writerow(trList)
				hdf.close()
output.close()

'''
