
### build
```
docker build -t ia_auto:latest .
```
### run
```
docker run -d -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v pwd:/app \
            --net=host \
            -e DISPLAY=$DISPLAY \
            --name ia_auto \
            ia_auto:latest
```


### Conflict fix
```
docker rm -f ia_auto && 
docker run -d -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v pwd:/app \
            --net=host \
            -e DISPLAY=$DISPLAY \
            --name ia_auto \
            ia_auto:latest
```
