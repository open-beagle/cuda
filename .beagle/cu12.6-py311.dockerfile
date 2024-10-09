ARG BASE

FROM $BASE

ARG AUTHOR
ARG VERSION

LABEL maintainer=$AUTHOR version=$VERSION

RUN curl -L https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb > \
  /tmp/cuda-keyring_1.1-1_all.deb && \
  dpkg -i /tmp/cuda-keyring_1.1-1_all.deb && \
  add-apt-repository contrib && \
  apt update && \
  apt -y install cuda-toolkit-12-6 && \
  apt clean && \
  rm -rf /tmp/cuda-keyring_1.1-1_all.deb

RUN apt-get update && \
  apt-get -y install cudnn-cuda-12 && \
  apt-get clean
