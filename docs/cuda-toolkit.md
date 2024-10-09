# cuda-toolkit

<https://developer.nvidia.com/cuda-toolkit-archive>

## python

<https://www.python.org/downloads/source/>

目前debian11上仅有Python3.9.x的安装包，而ComfyUI等主流框架推荐3.10

```bash
mkdir -p .tmp && \
curl -x socks5://www.ali.wodcloud.com:1283 \
  -L https://www.python.org/ftp/python/3.10.13/Python-3.10.13.tgz > \
  ./.tmp/Python-3.10.13.tgz && \
mc cp \
  ./.tmp/Python-3.10.13.tgz \
  cache/vscode/python/
```

## cuda

<https://www.python.org/downloads/source/>

目前debian11适配12.2的cuda版本，虽然更高的cuda版本意味着更好的性能，但是应用开发时没有那么高的驱动，所以未必用的起来更高版本的cuda。
但是有条件可以做一个cuda11.8的基础版本，因为很多框架很老，依赖cuda11.8.

```bash
mkdir -p .tmp && \
curl -x socks5://www.ali.wodcloud.com:1283 \
  -L https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda-repo-debian11-12-2-local_12.2.2-535.104.05-1_amd64.deb > \
  ./.tmp/cuda-repo-debian11-12-2-local_12.2.2-535.104.05-1_amd64.deb  && \
mc cp \
  ./.tmp/cuda-repo-debian11-12-2-local_12.2.2-535.104.05-1_amd64.deb \
  cache/vscode/cuda/local_installers/
```
