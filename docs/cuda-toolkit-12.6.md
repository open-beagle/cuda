# cuda-toolkit

[<https://developer.nvidia.com/cuda-toolkit-archive>](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=12&target_type=deb_local)

## cuda 12.6

### network_installers

```bash
docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -e DEBIAN_FRONTEND=noninteractive \
  registry.cn-qingdao.aliyuncs.com/wod/debian:12 \
  bash

apt update && \
apt install -y curl software-properties-common && \
mkdir -p .tmp && \
curl -sL https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb > .tmp/cuda-keyring_1.1-1_all.deb && \
dpkg -i .tmp/cuda-keyring_1.1-1_all.deb && \
add-apt-repository contrib && \
apt update && \
apt -y install cuda-toolkit-12-6
```

### local_installers

```bash
docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -e DEBIAN_FRONTEND=noninteractive \
  registry.cn-qingdao.aliyuncs.com/wod/debian:12 \
  bash

wget https://developer.download.nvidia.com/compute/cuda/12.6.2/local_installers/cuda-repo-debian12-12-6-local_12.6.2-560.35.03-1_amd64.deb
sudo dpkg -i cuda-repo-debian12-12-6-local_12.6.2-560.35.03-1_amd64.deb
sudo cp /var/cuda-repo-debian12-12-6-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo add-apt-repository contrib
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-6

mc cp \
  ./.tmp/cuda-repo-debian12-12-6-local_12.6.2-560.35.03-1_amd64.deb \
  cache/vscode/cuda/local_installers/
```

## cuDNN

<https://developer.nvidia.com/cudnn>

```bash
wget https://developer.download.nvidia.com/compute/cudnn/9.3.0/local_installers/cudnn-local-repo-debian12-9.3.0_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-debian12-9.3.0_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-debian12-9.3.0/cudnn-*-keyring.gpg /usr/share/keyrings/
sudo add-apt-repository contrib
sudo apt update
sudo apt -y install cudnn-cuda-12

mkdir -p .tmp && \
curl \
  -L https://developer.download.nvidia.com/compute/cudnn/9.3.0/local_installers/cudnn-local-repo-debian12-9.3.0_1.0-1_amd64.deb > \
  ./.tmp/cudnn-local-repo-debian12-9.3.0_1.0-1_amd64.deb  && \
mc cp \
  ./.tmp/cudnn-local-repo-debian12-9.3.0_1.0-1_amd64.deb \
  cache/vscode/cudnn/local_installers/
```
