Facial Emotion Recognition using TensorFlow!

DATA SET:
---------
- Download Data Set: `fer2013.bin` (63M) and `test_batch.bin` (7.9M) from https://goo.gl/ffmy2h

  Image Properties: `Size of an image` - 48 x 48 pixels (2304 bytes), `Size of a label` - number in (0..6) (1 byte) (0=Angry, 1=Fear, 2=Happy, 3=Sad, 4=Disgust, 5=Surprise, 6=Neutral).

  Data Set Format: `1st byte` is the label number and the `next 2304 bytes` are the image pixels.

- Create a data directory in your system: `/tmp/fer2013_data/`

- Put the training data set (28,709 images) in: `/tmp/fer2013_data/fer2013-batches-bin/fer2013.bin`

- Put the testing data set (3,589 images) in: `/tmp/fer2013_data/fer2013-batches-bin/test_batch.bin`

HOW TO RUN:
-----------
- Install `TensorFlow`: https://www.tensorflow.org/versions/r0.7/get_started/os_setup.html#pip-installation
- Run `python fer2013_train.py` (Takes ~20hrs on a quad core laptop!)
- Run `python fer2013_eval.py` on fer2013.bin data (Training Precision)
- Run `python fer2013_eval.py` on test_batch.bin data (Evaluation Precision)

STATS DASHBOARD:
----------------
- Run `tensorboard --logdir "/tmp"`
- Go to `http://0.0.0.0:6006/`
- This displays `events`, `images`, `graphs` and `histograms` for the train and eval runs on the model.

REFERENCES:
-----------
- Code references and examples from https://www.tensorflow.org
- Data Set from https://www.kaggle.com/c/challenges-in-representation-learning-facial-expression-recognition-challenge/data
