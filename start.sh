docker build -t bw-arm-docker .
docker run --rm -it --gpus all --network host --shm-size=96g bw-arm-docker