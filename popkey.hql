SELECT CASE WHEN pt.popularity_bool=0 THEN 'UNPOPULAR' ELSE 'POPULAR' END AS popularity_indicator, pt.time_signature, (pt.total/ts.total) * 100 AS TS_percent FROM
musicDb.popTimeSignWise pt, musicDb.timeSignWise ts
WHERE pt.time_signature = ts.time_signature;

SELECT CASE WHEN pt.popularity_bool=0 THEN 'UNPOPULAR' ELSE 'POPULAR' END AS popularity_indicator, pt.key, (pt.total/ts.total) * 100 AS key_percent FROM
musicDb.popKeyWise pt, musicDb.keyWise ts
WHERE pt.key = ts.key;