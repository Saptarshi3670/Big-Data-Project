## Project Name: Analysing Music Tracks for Popularity Prediction and Recommendation.
Data Size: 1.8 GB, 10000 songs with 54 features (Subset of Million Song Dataset). The complete dataset is split into several HDF5 that is compressed format to store large, complex and heterogeneous data files with each file representing one track with related meta-data like audio analysis, artist information, release date, etc.
Team Name: Data Worms
Team Members:  Kapil Khond | CWID: A20445656                                                                                                                             
               Ragi Saxena | CWID: A20432410
               Saptarshi Maiti | CWID: A20447671
               Ajith Kumar Vakkalaganti Sunil Kumar | CWID: A20446704


## Literature Review :
Top tier streaming companies rely on huge data sets to provide music recommendations for users. Users are either recommended with newly released tracks or tracks which users have never come across.

We reviewed 4 papers whose goals are very similar to our work.
First article is “Design and Implementation of Music Recommendation System Based on Hadoop“ by Yufeng, Zhao & Xinwei, Li. The proposed approach is based on distributed computing (MapReduce). The recommendation algorithm introduces K means clustering to improve the accuracy of the recommendation based on user-based collaborative filtering. Hadoop was used for storage and analysis purposes. The process of traditional user-based collaborative filtering involves constructing user-song data relational matrix, generating the nearest neighbor set and producing recommendations and in addition to this, introducing K means clustering improves the recommendation with high user similarity using minimum distance concept. Methods involving the removal of free points and selection of random points will have an impact on the efficiency of K means algorithm. Hadoop cluster is used in the recommendation algorithm layer, Java Servlets on the server side and MySQL for development. This paper puts forward a method of designing a recommendation system which incorporates K means clustering in traditional user based collaborative filtering recommendation algorithm which improves the overall precision.



Second article is “A Music Recommendation System Based on Music and User Grouping” by Hung-Chen Chen, Arbee L.P.Chen. The recommendation system proposed here is based on music data grouping and user’s interests. Here the Feature extractor and Classifier which are the core modules of recommendation system work together on music objects to assign group numbers based on the extracted features. A profile manager is further created from the above results and is engaged in several methods of recommendation namely content based recommendation where users are recommended based on former history of users, collaborative based where the recommendation is based on the interest of relevant users and statistical 
recommendation which works upon the combinational statistics to provide recommendations. In conclusion, for the three recommendation methods, the precision of the content based approach proves to be better than the collaborative and statistical methods. On the contrary, the collaborative method tends to provide unexpected music objects for users, which may be interesting. In addition, the statistical method provides hot music groups derived from all access histories. Therefore, the recommendation result of the statistical method proves to be better than that of the collaborative method. 



Third article is “Rage Against The Machine Learning: Predicting Song Popularity” by Cody ”C-Dawg” Kala , Andreas ”King-of-the-Keys” Garcia and Gabriel ”Getaway Driver” Barajas. Here some of the features including song key, tempo, average loudness, hotness/popularity index, string terms (out of the box features which might need further processing) and other acoustic features were focussed upon to predict the song popularity. The extracted features were briefly broken down into macro-level, micro-level, bag-of-words and location features. The deciding factors that affect the popularity of the song were determined by applying several machine learning algorithms and techniques involving feature extraction, clustering, regression, classification and selection. Linear regression with polynomial terms has better results compared to other regressions with enough L2 regularization. Significance of these features are determined for higher positive values indicating strong correlation with the popularity index/hotness.



Fourth article is “Predicting Song Popularity by James Q. Pham , Edric Kyauk and Edwin Park”. In this article the prediction of popularity of songs is done using both acoustic and meta-data features. As per their findings metadata features were found more predicative than the acoustic features like artist familiarity, year, loudness and some tag words, and a possible reason for this can be because of a lot of variation in acoustic features within a single song which makes extraction of metrics difficult, whereas metadata such as genre tags or year of release are much better at accurately reflecting a trait of a song. The classification algorithms, Logistic Regression, Linear Discriminant Analysis, Quadrant Discriminant Analysis, Support Vector Machines, Multilayer Perceptron Classification Algorithm are used to see whether a song is popular or not and in addition to accuracy, precision and recall, F1 and AUC scores of the models are also considered to classify the model. The highest F1 score was for SVM using the Gaussian kernel. Regresion is also applied as Classification loses valuable information about the value of the song popularity itself due to the binary conversion. MSE(Mean Squared Error) error metric is used to evaluate how the model predicts popularity.


Complete data was previously saved in UTF-8 format (predominantly using byte literals and unicode strings) and split into multiple HDF5 files. We further converted this data into single CSV file for convenient analysis purpose (decoding UTF-8, converting numpy array types into lists, structuring columns).
Pushing the data into HDFS using HDFS commands
We will be transforming and cleaning the data using Pig for convenient analysis
We will store the transformed and cleaned data in Hive tables for analysis.
We will create a pipeline to store relevant data into Hbase for ML model training for prediction and recommendation
We will create machine learning models using Spark ML for predicting the popularity of a song 
We will design recommendation system using collaborative,content based filtering 
Ajith, Ragi, Saptarshi, Kapil
Implementing K means clustering for improving the efficiency of recommendation system
For real time recommendations we use Spark Streaming and Kafka
Creating an API using FLASK for predicting popularity and Recommendations


## Citations:
Yufeng, Zhao & Xinwei, Li. (2018). Design and Implementation of Music Recommendation System Based on Hadoop. 
Hung-Chen Chen, Arbee L.P.Chen (2004). A Music Recommendation System Based on Music and User Grouping. 
Cody ”C-Dawg” Kala , Andreas ”King-of-the-Keys” Garcia and Gabriel ”Getaway Driver” Barajas (2017). Rage Against The Machine Learning: Predicting Song Popularity.
James Q. Pham , Edric Kyauk and Edwin Park (2015). Predicting Song Popularity.


