# Analysing Music Tracks For Popularity Prediction
Music industry has the lion's share in world's revenue as popular streaming services like Spotify and Apple Music give better choices for music listeners based on the features of previously released tracks. a model is trained for predicting the popularity of new songs. A model is trained for predicting the popularity of new songs based on the existing data of music tracks with features such as danceability, liveliness, loudness, acoustic-ness etc. It depends on the accuracy of the model that decides how closely it can predict whether a song will be popular or not, based on similar features of the songs. 

We will be using Spotify Audio Features dataset which has 17 audio features (artist_name, track_id, track_name, acousticness, danceability, duration_ms, energy, instrumentalness, key, liveness, loudness, mode, speechiness, tempo, time_signature, valence, popularity) of 130K tracks with 130326 unique track ids collected from Spotify Web API. Every feature was extracted from a track specific object in JSON format.

### Team Members:  Kapil Khond (CWID: A20445656), Ragi Saxena (CWID: A20432410), Saptarshi Maiti (CWID: A20447671), Ajith Kumar Vakkalaganti Sunil Kumar (CWID: A20446704)

## Method of Action (MoA)
To reach the final step of prediction we go through several data processing steps that include the following:
Data Loading and Transformation: We load in spotifyAudioFeatures dataset and transformed the data according to the requirements using Pig script.
Exploration Analysis: After transformation, the data is then explored and analysed using Hive.
Data Manipulation: This step involves one hot encoding, this converts the categorical variables into a form that could be provided to ML algorithms to do a better job in prediction. The feature “Key” has 12 sub categories namely, C#, D#, C, D, G#, F#, B, A, G, E, A#, F. Also, the feature “time_signature” this feature tells the meter of the piece of the song that is being played, and the categories for time_signature are 4, 3, 5, 1, 0. 
Data Preparation: The data is then split into 80% as train and 20%  as test.
Machine Learning Models: Then we train the model with algorithms that are Logistic Regression and Random Forest.
Evaluation Results: The evaluation results of the classification models are then reported using the Receiver Operating Characteristic curve (ROC).   

### Literature Review :
We reviewed several papers whose goals are very similar to our work
First article is “Rage Against The Machine Learning: Predicting Song Popularity” by Cody ”C-Dawg” Kala , Andreas ”King-of-the-Keys” Garcia and Gabriel ”Getaway Driver” Barajas. Here some of the features including song key, tempo, average loudness, hotness/popularity index, string terms (out of the box features which might need further processing) and other acoustic features were focussed upon to predict the song popularity. The extracted features were briefly broken down into macro-level, micro-level, bag-of-words and location features. The deciding factors that affect the popularity of the song were determined by applying several machine learning algorithms and techniques involving feature extraction, clustering, regression, classification and selection. Linear regression with polynomial terms has better results compared to other regressions with enough L2 regularization. Significance of these features are determined for higher positive values indicating strong correlation with the popularity index/hotness.

Second article is “Predicting Song Popularity by James Q. Pham , Edric Kyauk and Edwin Park”. In this article the prediction of popularity of songs is done using both acoustic and meta-data features. As per their findings metadata features were found more predicative than the acoustic features like artist familiarity, year, loudness and some tag words, and a possible reason for this can be because of a lot of variation in acoustic features within a single song which makes extraction of metrics difficult, whereas metadata such as genre tags or year of release are much better at accurately reflecting a trait of a song. The classification algorithms, Logistic Regression, Linear Discriminant Analysis, Quadrant Discriminant Analysis, Support Vector Machines, Multilayer Perceptron Classification Algorithm are used to see whether a song is popular or not and in addition to accuracy, precision and recall, F1 and AUC scores of the models are also considered to classify the model. The highest F1 score was for SVM using the Gaussian kernel. Regresion is also applied as Classification loses valuable information about the value of the song popularity itself due to the binary conversion. MSE(Mean Squared Error) error metric is used to evaluate how the model predicts popularity.

Third article is “HITPREDICT:Predicting Hit Songs Using Spotify Data by Georgieva, E., Suta, M., & Burton, N.”. In this article, based on the audio features, using Logistic Regression and Neural Network algorithms, it is determined whether the song will become a Billboard Hot 100 Hit or noty. A dataset of 4000 songs with both hit and non-hit songs, and the audio features are extracted from the Spotify Web API. The accuracy of song prediction was 75% on the test data. Similar to this approach we will train our model using Logistic Regression and Random Forest classifiers and predict whether a song is popular or not, the only variation is that our analysis will be based on the Hadoop platform by leveraging various components of Hadoop i.e. Apache Pig for data loading and transformation, Hive for exploring and analyzing the data and pySpark for training the models.


### Citations:
Cody ”C-Dawg” Kala , Andreas ”King-of-the-Keys” Garcia and Gabriel ”Getaway Driver” Barajas (2017). Rage Against The Machine Learning: Predicting Song Popularity.
James Q. Pham , Edric Kyauk and Edwin Park (2015). Predicting Song Popularity.
Georgieva, E., Suta, M., & Burton, N. (2018). HITPREDICT : Predicting Hit Songs Using Spotify Data.



