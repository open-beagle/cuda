ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt install -y \
  build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev \
  iputils-ping xz-utils jq vim curl wget git openssh-server software-properties-common && \
  curl -sL https://cache.wodcloud.com/vscode/python/Python-3.10.13.tgz > \
  /tmp/Python-3.10.13.tgz && \
  tar -xvf /tmp/Python-3.10.13.tgz -C /tmp && \
  cd /tmp/Python-3.10.13 && \
  ./configure --enable-optimizations && \
  make -j 4 && \
  make altinstall && \
  cd /usr/local/bin && \
  ln -s python3.10 python3 && \
  ln -s python3.10 python && \
  ln -s pip3.10 pip3 && \
  ln -s pip3.10 pip && \
  python --version && \
  apt remove -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev && \
  apt clean && \
  rm -rf /tmp/Python-3.10.13.tgz /tmp/Python-3.10.13

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
