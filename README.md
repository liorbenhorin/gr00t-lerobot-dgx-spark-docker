# GR00T Lerobot on DGX Spark playbook

The Dockerfile in this repo will build an image ready to train/inference gr00t via lerobot, on NVIDIA DGX Spark

### Configuration

- Arch: ARM
- GPU: GB10
- CUDA: 13.1
- torch: 2.9
- flash-attn: 2.8.4

Compiled binares for torch via [https://pypi.jetson-ai-lab.io/sbsa/cu130](https://pypi.jetson-ai-lab.io/sbsa/cu130)

### Instructions

On your DGX Spark

Note: First time will take ~45m to build due to `flash-attn`
```bash
git clone <this repo>
cd <this repo>
./start
```

