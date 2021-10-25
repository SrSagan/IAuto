docker rm -f ia_auto && 
docker run -t -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v $(pwd)/:/app \
            --net=host \
            -e DISPLAY=$DISPLAY \
            --name ia_auto \
            ia_auto:latest \
            python detect_floor.py