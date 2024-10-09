# cuda

## debug

```bash
docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -e DEBIAN_FRONTEND=noninteractive \
  registry.cn-qingdao.aliyuncs.com/wod/debian:11 \
  bash

docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -e DEBIAN_FRONTEND=noninteractive \
  registry.cn-qingdao.aliyuncs.com/wod/debian:12 \
  bash

docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/debian:11 \
  --build-arg AUTHOR=mengkzhaoyun@gmail.com \
  --build-arg VERSION=debian11-py310 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/cuda:debian11-py310 \
  --file .beagle/debian11-py310.dockerfile .

docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/cuda:debian11-py310 \
  --build-arg AUTHOR=mengkzhaoyun@gmail.com \
  --build-arg VERSION=12.1.1-py310 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/cuda:12.1.1-py310 \
  --file .beagle/cu12.1-py310.dockerfile .

docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  --entrypoint=bash \
  registry.cn-qingdao.aliyuncs.com/wod/cuda:12.1.1-py310
```
