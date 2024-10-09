ARG BASE

FROM $BASE

ARG AUTHOR
ARG VERSION

LABEL maintainer=$AUTHOR version=$VERSION

ARG DEBIAN_FRONTEND=noninteractive

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 --no-cache
