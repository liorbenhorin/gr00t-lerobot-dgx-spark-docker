#!/bin/bash
set -e

source /devel/.robotics/bin/activate

uv pip install torch torchvision torchcodec diffusers --index-url https://pypi.jetson-ai-lab.io/sbsa/cu130

uv pip install setuptools packaging

cd /tmp
git clone https://github.com/Dao-AILab/flash-attention.git
cd flash-attention
TORCH_CUDA_ARCH_LIST="12.1" MAX_JOBS=4 uv pip install . --no-build-isolation -v

python -c "
import torch
import flash_attn

print(f'PyTorch version: {torch.__version__}')
print(f'CUDA available: {torch.cuda.is_available()}')
print(f'CUDA version: {torch.version.cuda}')
print(f'flash-attention version: {flash_attn.__version__}')
"

