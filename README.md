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
  --build-arg BASE=registry.ali.wodcloud.com/wod/debian:11 \
  --build-arg AUTHOR=mengkzhaoyun@gmail.com \
  --build-arg VERSION=12.2.2-py310 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/cuda:12.2.2-py310 \
  --file .beagle/dockerfile .

docker run -it --rm \
  -v $PWD/:/go/src/gitlab.wodcloud.com/kubernetes/cuda \
  -w /go/src/gitlab.wodcloud.com/kubernetes/cuda \
  registry.ali.wodcloud.com/wod/cuda:12.2.2-py310 \
  bash
```
