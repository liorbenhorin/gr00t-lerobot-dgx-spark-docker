#!/bin/bash
set -e

apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:ubuntuhandbook1/ffmpeg7 -y
apt-get update
apt-get install -y \
    libavcodec61 \
    libavformat61 \
    libavutil59 \
    libavfilter10 \
    libswscale8 \
    libswresample5