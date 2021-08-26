import cv2

class ShapeDetector:
    def __init__(self):
        pass
    
    def detect(self, c):
        shape = 'unidentified'
        peri = cv2.arcLenght(c, True)
        approx = cv2.approxPolyDP(c, 0.04 * peri, True)

        if len(approx) == 4:
            (x, y, w, h) = cv2.boundingRect(approx)
            ar = w / float(h)
            shape = "square" if ar >= 0.95 and ar <= 1.05 else "rectangle"
        else: shape = "Desconocido"

        return shape

import argparse
import imutils
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True, help="path to img")
args = vars(ap.parse_args())

image = cv2.imread(args["image"])
resized = imutils.resize(image, width=300)
ratio = image.shape[0] / float(resized.shape[0])

gray= cv2.cvtColor(resized, cv2.COLOR_BGT2GRAY)
blurred = cv2.GaussianBlur(gray, (5,5), 0)
thresh = cv2.threshold(blurred, 60, 255, cv2.THRESH_BINARY)[1]

cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
cnts = imutils.grab_contours(cnts)
sd = ShapeDetector()

for c in cnts:
    M = cv2.moments(c)
    cX = int((M["m10"] /M["m00"]) * ratio)
    cY = int((M["m01"] /M["m00"]) * ratio)
    shape = sd.detect(c)