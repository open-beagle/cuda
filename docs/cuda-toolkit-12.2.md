# cuda-toolkit

[<https://developer.nvidia.com/cuda-toolkit-archive>](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=12&target_type=deb_local)

## cuda 12.2

### network_installers

```bash
docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -e DEBIAN_FRONTEND=noninteractive \
  registry.cn-qingdao.aliyuncs.com/wod/debian:11 \
  bash

apt update && \
apt install -y curl software-properties-common && \
mkdir -p .tmp && \
curl -sL https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/cuda-keyring_1.1-1_all.deb > .tmp/cuda-keyring_1.1-1_all.deb && \
dpkg -i .tmp/cuda-keyring_1.1-1_all.deb && \
add-apt-repository contrib && \
apt update && \
apt install -y cuda-toolkit-12-2
```

### local_installers

```bash
docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -e DEBIAN_FRONTEND=noninteractive \
  registry.cn-qingdao.aliyuncs.com/wod/debian:11 \
  bash

wget https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda-repo-debian11-12-2-local_12.2.2-535.104.05-1_amd64.deb
sudo dpkg -i cuda-repo-debian11-12-2-local_12.2.2-535.104.05-1_amd64.deb
sudo cp /var/cuda-repo-debian11-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo add-apt-repository contrib
sudo apt update
sudo apt install -y cuda-toolkit-12-2

mc cp \
  ./.tmp/cuda-repo-debian11-12-2-local_12.2.2-535.104.05-1_amd64.deb \
  cache/vscode/cuda/local_installers/
```
