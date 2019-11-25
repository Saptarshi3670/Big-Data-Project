# -*- coding: utf-8 -*-
"""
Created on Sun Nov 24 20:19:19 2019

@author: kapil
"""

import findspark
findspark.init()
findspark.find()
import pyspark
import matplotlib.pyplot as plt
findspark.find()
import pandas as pd
from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext
from pyspark.sql.functions import col
from pyspark.ml.regression import LinearRegression
from pyspark.ml.evaluation import RegressionEvaluator
from pyspark.ml.classification import LogisticRegression
from pyspark.sql.functions import col, split
from pyspark.ml.feature import VectorAssembler
from pyspark.ml import Pipeline
from pyspark.sql.types import *
from pyspark.sql.functions import *
from pyspark.sql import Row
from collections import OrderedDict
import sys
import os

#Import Spark CountVectorizer
from pyspark.ml.feature import CountVectorizer,OneHotEncoderEstimator,StringIndexer


sc = SparkContext()
sqlContext = SQLContext(sc)


import pyspark.sql.types as tp


spotify_og  = sqlContext.read.format('com.databricks.spark.csv').options(header='true', inferschema='true').load(r"D:\Data Science\Big Data Technologies\project\\Spotify-original_final2.csv")

#drop the unnecessary columns
spotify_og = spotify_og.drop(*['_c0','artist_name', 'track_id', 'track_name','popularity'])
spotify_og = spotify_og.withColumnRenamed("pop_bool","label")

spotify_og = spotify_og.withColumn("acousticness", spotify_og["acousticness"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("danceability", spotify_og["danceability"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("duration_ms", spotify_og["duration_ms"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("energy", spotify_og["energy"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("instrumentalness", spotify_og["instrumentalness"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("liveness", spotify_og["liveness"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("loudness", spotify_og["loudness"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("mode", spotify_og["mode"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("speechiness", spotify_og["speechiness"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("tempo", spotify_og["tempo"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("valence", spotify_og["valence"].cast(DoubleType()))
spotify_og = spotify_og.withColumn("label", spotify_og["label"].cast(IntegerType())) 
spotify_og = spotify_og.fillna(0)


#create object of StringIndexer class and specify input and output column
stage_1  = StringIndexer(inputCol='key',outputCol='key_index').setHandleInvalid("skip")
stage_2 = StringIndexer(inputCol='time_signature',outputCol='time_signature_index').setHandleInvalid("skip")

# create object and specify input and output column
stage_3 = OneHotEncoderEstimator(inputCols=['key_index', 'time_signature_index'],outputCols=['key_OHE', 'time_signature_OHE'])


stage_4 = VectorAssembler(inputCols=['acousticness','danceability','duration_ms','energy','instrumentalness','liveness','loudness','mode','speechiness','tempo','valence','key_OHE','time_signature_OHE'], outputCol = 'features')

lr = LogisticRegression(featuresCol='features',labelCol='label',maxIter = 50)

regression_pipeline = Pipeline(stages= [stage_1, stage_2, stage_3, stage_4])
# transform the data



pipe_fit = regression_pipeline.fit(spotify_og)
pipe_transformed = pipe_fit.transform(spotify_og)

train_df = sqlContext.createDataFrame(pipe_transformed.head(104530), pipe_transformed.schema)
#Take the rest of the rows
test_df = pipe_transformed.subtract(train_df)

lr_model = lr.fit(train_df)
train_pred = lr_model.transform(train_df)
test_pred = lr_model.transform(test_df)


# Extract the summary from the returned LogisticRegressionModel instance trained
trainingSummary = lr_model.summary

# Obtain the objective per iteration
objectiveHistory = trainingSummary.objectiveHistory
plt.plot(objectiveHistory)
plt.ylabel('Objective Function')
plt.xlabel('Iteration')
plt.show()


print('Training set accuarcy : ' + str(trainingSummary.accuracy))
print('Training set weighted precision : ' + str(trainingSummary.weightedPrecision))
print('Training set weighted precision : ' + str(trainingSummary.weightedRecall))

#model.save(sc,"logistic.model")
model.save(os.path.join(r"D:\logisticRgression-model",'logReg-model'))
#predictions.select('prediction', 'popularity', 'features').show(10)
from pyspark.ml.evaluation import BinaryClassificationEvaluator

#evaluator.getMetricName()
#BinaryClassificationEvaluator().evaluate(test_pred,{evaluator.metricName:"accuracy"})

#evaluator=BinaryClassificationEvaluator(rawPredictionCol="probability",labelCol="label")
#predict_test.select("Outcome","rawPrediction","prediction","probability").show(5)

print("The area under ROC for train set is {}".format(BinaryClassificationEvaluator().evaluate(train_pred)))
print("The area under ROC for test set is {}".format(BinaryClassificationEvaluator().evaluate(test_pred)))
   



def convert_to_row(d: dict) -> Row:
    return Row(**OrderedDict(sorted(d.items())))



#test = sc.parallelize([{'acousticness': '7.05e-06','danceability': '0.399','duration_ms': '55653.0','energy': '0.996','instrumentalness': '0.927','key': '1.0','liveness': '0.34600000000000003','loudness': '-7.592','mode': '1.0','speechiness': '0.07200000000000001','tempo': '137.976','label':'0','time_signature': '4.0','valence': '0.57','artist_name': 'R3HAB','track_name': 'Radio Silence','track_id': '6Wosx2euFPMT14UXiWudMy'}]).map(convert_to_row).toDF()

test = sc.parallelize([{'acousticness': '0.0','danceability': '0.937','duration_ms':  '0.431','label':'1','energy': '246345.0','instrumentalness': '0.0657','key': '0.00177','liveness': '11.0','loudness': '0.279','mode': '-17.317','speechiness': '0.0','tempo': '0.0537','time_signature': '138.322','valence': '3.0','track_name': "Debauchery - Original mix",'track_id': "26Y1lX7ZOpw9Ql3gGAlqLK",'artist_name': "treautu"}]).map(convert_to_row).toDF()

print (test.show())
print ("actual label"+":")
print (test.select('label').show())
test = test.drop(*['_c0','artist_name', 'track_id', 'track_name','label'])

test = test.withColumn("acousticness", test["acousticness"].cast(DoubleType()))
test = test.withColumn("danceability", test["danceability"].cast(DoubleType()))
test = test.withColumn("duration_ms", test["duration_ms"].cast(DoubleType()))
test = test.withColumn("energy", test["energy"].cast(DoubleType()))
test = test.withColumn("instrumentalness", test["instrumentalness"].cast(DoubleType()))
test = test.withColumn("liveness", test["liveness"].cast(DoubleType()))
test = test.withColumn("loudness", test["loudness"].cast(DoubleType()))
test = test.withColumn("mode", test["mode"].cast(DoubleType()))
test = test.withColumn("speechiness", test["speechiness"].cast(DoubleType()))
test = test.withColumn("tempo", test["tempo"].cast(DoubleType()))
test = test.withColumn("valence", test["valence"].cast(DoubleType()))
test = test.fillna(0)
lr_pred = model.transform(test)

print ("predicted label:")
print (lr_pred.select('prediction').show())





test_array = []
#test_array.append({'artist_name': 'YG','track_id': '2RM4jf1Xa9zPgMGRDiht8O','track_name': 'Big Bank feat. 2 Chainz, Big Sean, Nicki Minaj','acousticness': 0.00582,'danceability': 0.743,'duration_ms': 238373,'energy': 0.338,'instrumentalness': 0.0,'key': 1,'liveness': 0.0812,'loudness': -7.678,'mode': 1,'speechiness': 0.409,'tempo': 203.927,'time_signature': 4,'valence': 0.118})
test_array.append(tp)



#test = sc.parallelize(test_array).map(convert_to_row).toDF()
#test = sc.parallelize([test_pandas_dict]).map(convert_to_row).toDF()








print ("actual label" + "0")