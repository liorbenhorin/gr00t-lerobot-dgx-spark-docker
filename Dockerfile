FROM nvidia/cuda:13.0.2-cudnn-devel-ubuntu24.04

RUN apt-get update --yes && apt-get install -y --no-install-recommends \
        ffmpeg \
        libatlas-base-dev \
        libavcodec-dev \
        libavformat-dev \
        libcanberra-gtk3-module \
        libeigen3-dev \
        libglew-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer-plugins-good1.0-dev \
        libgstreamer1.0-dev \
        libgtk-3-dev \
        libjpeg-dev \
        libjpeg8-dev \
        libjpeg-turbo8-dev \
        liblapack-dev \
        libopenblas-dev \
        libpng-dev \
        libpostproc-dev \
        libswscale-dev \
        libtesseract-dev \
        libtiff-dev \
        libv4l-dev \
        libxine2-dev \
        libxvidcore-dev \
        libx264-dev \
        libgtkglext1 \
        libgtkglext1-dev \
        pkg-config \
        qv4l2 \
        v4l-utils \
        zlib1g-dev \
        file \
        tar \
        libtbbmalloc2 \
        libtbb-dev \
        wget \
        dpkg \
        git \
        curl \
        python3-dev \
        python3-pip \
        ninja-build \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN wget https://developer.download.nvidia.com/compute/nvpl/25.5/local_installers/nvpl-local-repo-ubuntu2404-25.5_1.0-1_arm64.deb
RUN dpkg -i nvpl-local-repo-ubuntu2404-25.5_1.0-1_arm64.deb
RUN cp /var/nvpl-local-repo-ubuntu2404-25.5/nvpl-*-keyring.gpg /usr/share/keyrings/
RUN apt-get update
RUN apt-get -y install nvpl

RUN wget https://developer.download.nvidia.com/compute/cudss/0.7.0/local_installers/cudss-local-repo-ubuntu2404-0.7.0_0.7.0-1_arm64.deb
RUN dpkg -i cudss-local-repo-ubuntu2404-0.7.0_0.7.0-1_arm64.deb
RUN cp /var/cudss-local-repo-ubuntu2404-0.7.0/cudss-*-keyring.gpg /usr/share/keyrings/
RUN apt-get update
RUN apt-get -y install cudss


RUN mkdir -p /devel
WORKDIR /devel

RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    export PATH="$HOME/.local/bin:$PATH" && \
    uv venv .robotics


ENV VIRTUAL_ENV=/devel/.robotics
ENV PATH="/devel/.robotics/bin:/root/.local/bin:$PATH"


COPY install_deps.sh /tmp/install_deps.sh
RUN chmod +x /tmp/install_deps.sh && \
    /tmp/install_deps.sh && \
    rm /tmp/install_deps.sh

COPY install_torchcodec_deps.sh /tmp/install_torchcodec_deps.sh
RUN chmod +x /tmp/install_torchcodec_deps.sh && \
    /tmp/install_torchcodec_deps.sh && \
    rm /tmp/install_torchcodec_deps.sh

COPY install_lerobot_deps.sh /tmp/install_lerobot_deps.sh
RUN chmod +x /tmp/install_lerobot_deps.sh && \
    /tmp/install_lerobot_deps.sh && \
    rm /tmp/install_lerobot_deps.sh


WORKDIR /devel/lerobot

# Customize bash prompt to show virtualenv name
RUN echo 'export PS1="(.robotics) \u@\h:\w# "' >> /root/.bashrc

CMD ["bash"]