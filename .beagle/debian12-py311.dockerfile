ARG BASE

FROM $BASE

ARG AUTHOR
ARG VERSION

LABEL maintainer=$AUTHOR version=$VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
  apt install -y \
  iputils-ping xz-utils jq vim curl wget git openssh-server software-properties-common \
  python3.11 python3.11-dev python3.11-venv python3-pip && \
  apt clean && \
  rm -rf /etc/localtime && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BEAGLE_ROOT=/beagle
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/ && \
  python3 -m venv ~/.venv && \
  . ~/.venv/bin/activate && \
  pip install --no-cache jupyter jupyterlab-language-pack-zh-CN && \
  ln -s /root/.venv/bin/jupyter /usr/bin/jupyter && \
  ln -s /root/.venv/bin/jupyter-console /usr/bin/jupyter-console && \
  ln -s /root/.venv/bin/jupyter-dejavu /usr/bin/jupyter-dejavu && \
  ln -s /root/.venv/bin/jupyter-events /usr/bin/jupyter-events && \
  ln -s /root/.venv/bin/jupyter-execute /usr/bin/jupyter-execute && \
  ln -s /root/.venv/bin/jupyter-kernel /usr/bin/jupyter-kernel && \
  ln -s /root/.venv/bin/jupyter-kernelspec /usr/bin/jupyter-kernelspec && \
  ln -s /root/.venv/bin/jupyter-lab /usr/bin/jupyter-lab && \
  ln -s /root/.venv/bin/jupyter-labextension /usr/bin/jupyter-labextension && \
  ln -s /root/.venv/bin/jupyter-labhub /usr/bin/jupyter-labhub && \
  ln -s /root/.venv/bin/jupyter-migrate /usr/bin/jupyter-migrate && \
  ln -s /root/.venv/bin/jupyter-nbconvert /usr/bin/jupyter-nbconvert && \
  ln -s /root/.venv/bin/jupyter-notebook /usr/bin/jupyter-notebook && \
  ln -s /root/.venv/bin/jupyter-qtconsole /usr/bin/jupyter-qtconsole && \
  ln -s /root/.venv/bin/jupyter-run /usr/bin/jupyter-run && \
  ln -s /root/.venv/bin/jupyter-server /usr/bin/jupyter-server && \
  ln -s /root/.venv/bin/jupyter-troubleshoot /usr/bin/jupyter-troubleshoot && \
  ln -s /root/.venv/bin/jupyter-trust /usr/bin/jupyter-trust 

COPY settings/plugin.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/translation-extension/plugin.jupyterlab-settings

COPY ./nvidia_entrypoint.sh /opt/nvidia/nvidia_entrypoint.sh

RUN curl -L https://cache.wodcloud.com/kubernetes/bgctl/amd64/bgctl > \
  /usr/local/bin/bgctl && \ 
  chmod +x /usr/local/bin/bgctl && \ 
  chmod +x /opt/nvidia/nvidia_entrypoint.sh

WORKDIR /beagle

ENTRYPOINT ["/opt/nvidia/nvidia_entrypoint.sh"]
