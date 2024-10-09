# ComfyUI-LivePortrait

<https://github.com/ltdrdata/ComfyUI-Manager>

## ComfyUI

### 安装依赖

```bash
apt update && \
apt install -y git xz-utils aria2 jq vim && \
git config --global http.proxy 'socks5://www.ali.wodcloud.com:1283' && \
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
python -m venv /beagle/.venv && \
. /beagle/.venv/bin/activate
```

### 安装本体

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git /beagle/ComfyUI && \
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
pip install -r /beagle/ComfyUI/requirements.txt
```

## Custom Nodes

### 安装插件 | ComfyUI-Manager

```bash
git clone https://github.com/ltdrdata/ComfyUI-Manager.git /beagle/ComfyUI/custom_nodes/ComfyUI-Manager && \
pip install -r /beagle/ComfyUI/custom_nodes/ComfyUI-Manager/requirements.txt
```

### 安装插件 | ComfyUI-Translation

```bash
git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION.git /beagle/ComfyUI/custom_nodes/AIGODLIKE_TRANSLATION
```

### 安装插件 | ComfyUI-InstantID

```bash
git clone https://github.com/Mengkzhaoyun/ComfyUI-InstantID.git /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID && \
pip install -r /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/requirements.txt
```

### 安装插件 | ComfyUI-Gemini

```bash
git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-Gemini.git /beagle/ComfyUI/custom_nodes/ComfyUI-Gemini && \
pip install -r /beagle/ComfyUI/custom_nodes/ComfyUI-Gemini/requirements.txt
```

### 安装插件 | ComfyUI-ArtGallery

```bash
git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-ArtGallery.git /beagle/ComfyUI/custom_nodes/ComfyUI-ArtGallery

curl -x socks5://www.ali.wodcloud.com:1283 -L \
  https://github.com/ZHO-ZHO-ZHO/ComfyUI-ArtGallery/archive/refs/heads/main.zip > \
  /tmp/ComfyUI-ArtGallery.zip && \
```

### 下载模型 | InstantID/ControlNetModel

```bash
baseURL="https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/models/checkpoints -o ip-adapter.bin && \
baseURL="https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/config.json?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/models/controlnet -o config.json && \
baseURL="https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/models/controlnet -o diffusion_pytorch_model.safetensors

baseURL="https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/1k3d68.onnx?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2 -o 1k3d68.onnx && \
baseURL="https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/2d106det.onnx?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2 -o 2d106det.onnx && \
baseURL="https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/genderage.onnx?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2 -o genderage.onnx && \
baseURL="https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/glintr100.onnx?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2 -o glintr100.onnx && \
baseURL="https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/scrfd_10g_bnkps.onnx?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2 -o scrfd_10g_bnkps.onnx
```

### 下载模型 | huggingface.co | wangqixun/YamerMIX_v8

```bash
pip install -U "huggingface_hub[cli]"
export HF_HOME="/beagle/huggingface" && \
export HF_ENDPOINT=https://hf-mirror.com && \
huggingface-cli download wangqixun/YamerMIX_v8
```

### 初始化

```bash
echo '{ "AGL.Locale": "zh-CN", "Comfy.UseNewMenu": "Top" }' | jq > /beagle/ComfyUI/user/default/comfy.settings.json

cp "/beagle/ComfyUI/custom_nodes/ComfyUI-InstantID/INSTANTID WORKFLOWS/V2.0 InstantID_pose_ref + ArtGallery 【Zho】.json" /beagle/ComfyUI/user/default/workflows/default.json && \
sed -i 's/\/content\/ComfyUI/\/beagle\/ComfyUI/g' /beagle/ComfyUI/user/default/workflows/default.json && \
jsonData=$(jq . /beagle/ComfyUI/user/default/workflows/default.json) && \
echo "export const defaultGraph = $jsonData;" > /beagle/ComfyUI/web/scripts/defaultGraph.js
```

## Run

```bash
cat > /beagle/entrypoint.sh <<-EOF
#!/bin/sh
. /beagle/.venv/bin/activate

cd /beagle/ComfyUI
export HF_HOME="/beagle/huggingface"
export HF_ENDPOINT=https://hf-mirror.com
python main.py --dont-print-server --listen "0.0.0.0" --port "8188"
EOF
```
