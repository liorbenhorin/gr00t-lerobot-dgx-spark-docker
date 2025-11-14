#!/bin/bash
set -e

source /devel/.robotics/bin/activate

cd /devel
git clone https://github.com/huggingface/lerobot.git
cd lerobot
uv pip install -e .[groot] --no-deps

uv pip install \
    "transformers>=4.53.0,<5.0.0" \
    "deepdiff>=7.0.1,<9.0.0" \
    "imageio[ffmpeg]>=2.34.0,<3.0.0" \
    "termcolor>=2.4.0,<4.0.0" \
    "draccus==0.10.0" \
    "gymnasium>=1.1.1,<2.0.0" \
    "rerun-sdk>=0.24.0,<0.27.0" \
    accelerate \
    huggingface-hub[hf-transfer,cli] \
    "datasets>=4.0.0,<4.2.0" \
    "opencv-python-headless>=4.9.0,<4.13.0" \
    "av>=15.0.0,<16.0.0" \
    "jsonlines>=4.0.0,<5.0.0" \
    "pyserial>=3.5,<4.0" \
    "wandb>=0.20.0,<0.22.0" \
    "peft>=0.13.0,<1.0.0" \
    "dm-tree>=0.1.8,<1.0.0" \
    "timm>=1.0.0,<1.1.0"

