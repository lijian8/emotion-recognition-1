Facial Emotion Recognition using TensorFlow!

DATA SET:
---------
- Download Data Set: `fer2013.bin` and `test_batch.bin` from https://drive.google.com/open?id=0B3AAd5V37KvzeV96ZDd3dTFJNDA

  Image Properties: `Size of an image` - 48 x 48 pixels (2304 bytes), `Size of a label` - number in (0..6) (1 byte) (0=Angry, 1=Disgust, 2=Fear, 3=Happy, 4=Sad, 5=Surprise, 6=Neutral).

  Data Set Format: `1st byte` is the label number and the `next 2304 bytes` are the image pixels.

- Create a data directory in your system: `/tmp/fer2013_data/`

- Put the training data set (28,709 images) in: `/tmp/fer2013_data/fer2013-batches-bin/fer2013.bin`

- Put the testing data set (3,589 images) in: `/tmp/fer2013_data/fer2013-batches-bin/test_batch.bin`

HOW TO RUN:
-----------
- Install `TensorFlow`: https://www.tensorflow.org/versions/r0.7/get_started/os_setup.html#pip-installation
- Download `emotion-recognition` project folder inside `/Library/Python/2.7/site-packages/tensorflow/models/image/`
- Run `python fer2013_train.py` (Takes ~20hrs on a quad core laptop!)
- Run `python fer2013_eval.py`

REFERENCES:
-----------
- https://www.tensorflow.org
- https://www.kaggle.com/c/challenges-in-representation-learning-facial-expression-recognition-challenge/data
