import argparse
import imutils
import cv2


class ShapeDetector:
    def __init__(self):
        pass

    def detect(self, c, width):
        shape = 'unidentified'
        peri = cv2.arcLength(c, True)
        approx = cv2.approxPolyDP(c, 0.04 * peri, True)
        print(len(approx))

        (x, y, w, h) = cv2.boundingRect(approx)
        print("x:",x)
        puntIzq = x
        puntDer = x+w
        if width/2 < x:
            print("esta a la derecha")
        else:
            print("esta a la izquierda")


        if len(approx) == 4:
            (x, y, w, h) = cv2.boundingRect(approx)
            ar = w / float(h)
            print("x:",x)
            print("y:",y)
            print("w:",w)
            print("h:",h)
            print("ar",ar)
            shape = "square" if ar >= 0.95 and ar <= 1.05 else "rectangle"
            print(ar)
        else:
            (x, y, w, h) = cv2.boundingRect(approx)
            ar = w / float(h)
            print("x:",x)
            print("y:",y)
            print("w:",w)
            print("h:",h)
            print("ar",ar)
            shape = "Desconocido"

        return shape


ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True, help="path to img")
args = vars(ap.parse_args())

image = cv2.imread(args["image"])
resized = imutils.resize(image, width=300)
ratio = image.shape[0] / float(resized.shape[0])

gray = cv2.cvtColor(resized, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray, (5, 5), 0)
thresh = cv2.threshold(blurred, 60, 255, cv2.THRESH_BINARY)[1]

cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
                        cv2.CHAIN_APPROX_SIMPLE)
cnts = imutils.grab_contours(cnts)
sd = ShapeDetector()
height = image.shape[1]
print(height)


for c in cnts:
    M = cv2.moments(c)
    cX = int((M["m10"] / (M["m00"] + 1e-7)) * ratio)
    cY = int((M["m01"] / (M["m00"] + 1e-7)) * ratio)
    shape = sd.detect(c, height)

    c = c.astype("float")
    c *= ratio
    c = c.astype("int")
    cv2.drawContours(image, [c], -1, (0, 255, 0), 2)
    cv2.putText(image, shape, (cX, cY), cv2.FONT_HERSHEY_SIMPLEX,
                0.5, (0, 255, 255), 2)
    # show the output image
    cv2.imshow("Image", image)
    cv2.waitKey(0)
