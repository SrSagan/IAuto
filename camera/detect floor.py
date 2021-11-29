import cv2
import urllib.request

DEBUG = 0
exposicion_mode=0

capture = cv2.VideoCapture("stock.webm")

capture.set(3, 1024)  # 1024 640 1280 800 384
capture.set(4, 760)  # 600 480 960 600 288

DisplayImage = True


def Pendiente(xy1, xy2):
    x1 = xy1[0]
    y1 = xy1[1]
    x2 = xy2[0]
    y2 = xy2[1]

    out = (((y2-y1)+1) / ((x2-x1)+1))*100
    return out


def Reconocimiento():
    StepSize = 10
    EdgeArray = []
    #time.sleep(0.5)  # let image settle

    # get a bunch of frames to make sure current frame is the most recent
    ret, img = capture.read()
    ret, img = capture.read()
    ret, img = capture.read()
    ret, img = capture.read()
    ret, img = capture.read()  # 5 seems to be enough
    # convert img to grayscale and store result in imgGray
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # blur the image slightly to remove noise
    imgGray = cv2.bilateralFilter(imgGray, 9, 30, 30)
    imgEdge = cv2.Canny(imgGray, 5, 20)  # edge detection

    imagewidth = imgEdge.shape[1] - 1
    imageheight = imgEdge.shape[0] - 1

    centre=[img.shape[1]/2 ,img.shape[0]/2]
    EdgeArrayHeight = []

    for j in range(0, imagewidth, StepSize):  # for the width of image array
        # step through every pixel in height of array from bottom to top
        for i in range(imageheight-5, 0, -1):
            # Ignore first couple of pixels as may trigger due to undistort
            # check to see if the pixel is white which indicates an edge has been found
            if imgEdge.item(i, j) == 255:
                EdgeArrayHeight.append(i)
                # if it is, add x,y coordinates to ObstacleArray
                EdgeArray.append((j, i))
                break  # if white pixel is found, skip rest of pixels in column
        else:
            EdgeArrayHeight.append(0)  # no white pixel found
            # if nothing found, assume no obstacle. Set pixel position way off the screen to indicate
            EdgeArray.append((j, 0))
            # no obstacle detected

    for x in range(len(EdgeArray)-1):  # draw lines between points in ObstacleArray
        if(DEBUG == 1):
            cv2.line(img, EdgeArray[x], EdgeArray[x+1], (0, 0, 255), 5)

    comienzoRecta = 1  # first point
    differenceDelta = 20  # the difference to detect to start and end a "curve or line"
    # draw lines from bottom of the screen to points in ObstacleArray
    first=0
    for x in range(len(EdgeArray)):
        if(comienzoRecta == 1):  # first point is saved in inPoint
            inPoint = EdgeArray[x]
            comienzoRecta = 0
        else:
            if((EdgeArray[x-1][1] - EdgeArray[x][1]) >= differenceDelta or (EdgeArray[x-1][1] - EdgeArrayHeight[x]) <= -differenceDelta):
                # checks if the difference between 2 points is bigger than the differenceDelta

                if(DEBUG == 1):
                    print("difference found:",
                          (EdgeArray[x-1][1] - EdgeArray[x][1]))

                # draws a line between the "initial point/end of last line" to the point found
                if(EdgeArray[x-1][0] - inPoint[0] > 10):
                    pendiente = Pendiente(inPoint, EdgeArray[x-1])
                    cv2.putText(img, str(round(pendiente, 2)), inPoint,
                                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
                    cv2.line(img, inPoint, EdgeArray[x-1], (255, 0, 0), 5)

                    if(first==0):
                        izquierda=pendiente
                        first=1

                # we need to calculate the slope (pendiente) of the line
                # we'll (y2-y1)/(x2-x1)

                inPoint = EdgeArray[x]  # changes initial point
            # if it reached the end of the image it draws from last point to the end, since it didn't find anything else
            if(x == len(EdgeArrayHeight)-1):
                cv2.line(img, inPoint, EdgeArray[x], (255, 0, 0), 5)

                pendiente = Pendiente(inPoint, EdgeArray[x-1])
                cv2.putText(img, str(round(pendiente, 2)), inPoint,
                            cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
                
                
                magicNumber=round(pendiente+izquierda)
                if(magicNumber >= 180): magicNumber=180
                if(magicNumber <= -180): magicNumber=-180
                #DESCONEMNTAR ESTA LINEA PARA MANDAR AL ESP32
                r = urllib.request.urlopen('http://192.168.4.1/'+str(magicNumber)+"!")
                print(magicNumber)

                cv2.putText(img, str(round(pendiente+izquierda, 2)), (512, 384),
                            cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)

        if(DEBUG == 1):
            cv2.line(img, (x*StepSize, imageheight),
                     EdgeArray[x], (0, 255, 0), 1)

    if DisplayImage is True:
        cv2.namedWindow("camera", cv2.WINDOW_NORMAL)
        cv2.imshow("camera", img)
        cv2.waitKey(10)


while True:
    if(exposicion_mode==1):
        try:
            Reconocimiento()
        except:
            capture = cv2.VideoCapture("stock2.webm")
            capture.set(3, 1024)  # 1024 640 1280 800 384
            capture.set(4, 768)  # 600 480 960 600 288
    else:
        Reconocimiento()
