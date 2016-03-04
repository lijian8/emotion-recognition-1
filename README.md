Facial Emotion Recognition using TensorFlow

DATA SET:
---------
Image Properties:
Size of image - 48 x 48 pixels (2304 bytes)
Size of label - (1..7) range (1 byte) (0=Angry, 1=Disgust, 2=Fear, 3=Happy, 4=Sad, 5=Surprise, 6=Neutral)

Data Set Format:
1st byte - Label Value
Next 2304 bytes - Image Pixels

Data Set Source (fer2013):
https://www.kaggle.com/c/challenges-in-representation-learning-facial-expression-recognition-challenge/data

Data Set Modification:
`write-binary.rb` converts csv of uint8 image pixels to a binary file.

Create a data directory in your system:
/tmp/fer2013_data/

Put training data set (28,709 images):
/tmp/fer2013_data/fer2013-batches-bin/fer2013.bin

Put testing data set (3,589 images):
/tmp/fer2013_data/fer2013-batches-bin/test_batch.bin

HOW TO RUN:
-----------
python fer2013_train.py
python fer2013_eval.py
