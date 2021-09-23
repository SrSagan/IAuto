
FROM python:3.8-slim-buster


WORKDIR /app

RUN apt-get update 
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get update && apt-get install -y python3-opencv
RUN pip install opencv-python



#CMD ["sh", "-c", "tail -f /dev/null"]
CMD ["python", "detect_floor.py"]


