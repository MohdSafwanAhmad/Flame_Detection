#!/usr/bin/env python
# coding: utf-8

# In[1]:


import cv2


# In[ ]:


vidcap = cv2.VideoCapture('F_Test_Movie_sensitivity_analysis_rad_change.avi')
def getFrame(sec):
    vidcap.set(cv2.CAP_PROP_POS_MSEC,sec*1000)
    hasFrames,image = vidcap.read()
    if hasFrames:
        cv2.imwrite("rad_change_image"+str(count)+".jpg", image)     # save frame as JPG file
    return hasFrames
sec = 0
frameRate = .035 
count=1
success = getFrame(sec)
while success:
    count = count + 1
    sec = sec + frameRate
    sec = round(sec, 2)
    success = getFrame(sec)

