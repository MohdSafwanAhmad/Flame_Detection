1. I have pretrained the object detection model to be able to run the algorithm. Please find details at https://tensorflow-object-detection-api-tutorial.readthedocs.io/en/latest/training.html

# What model to download.
MODEL_NAME = 'flame_graph'

# Path to frozen detection graph. This is the actual model that is used for the object detection.
PATH_TO_FROZEN_GRAPH = MODEL_NAME + '/frozen_inference_graph.pb'

# List of the strings that is used to add correct label for each box.
PATH_TO_LABELS = os.path.join('training', 'label_map.pbtxt')

I have also added the frozen_inference_graph.pb and  label_map.pbtxt files here.

Note: Output of the main python script provides us the values of the coordinates. 


2. If it doesn’t work, do the following:

a. log in to my computer and go to Home>project1>Tensorflow>models>research>object_detection and right click and click on open in terminal.
b. Open jupyter notebook in the terminal.
c. open flame_detection_model.ipynb and run it.

3. Preparing the dataset:
a. Creation of video – Circle_Generation_v2.m
b. Splitting video to images to use for labeling – split_video.py
c. Use LabelImg to make bounding boxes

