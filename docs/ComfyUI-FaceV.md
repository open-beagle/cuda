# ComfyUI-InstantID

<https://github.com/shadowcz007/comfyui-liveportrait>

## ComfyUI

### 安装依赖

```bash
apt update && \
apt install -y git xz-utils aria2 jq vim && \
git config --global http.proxy 'socks5://www.ali.wodcloud.com:1283' && \
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/ && \
python -m venv /beagle/.venv && \
. /beagle/.venv/bin/activate
```

### 安装本体

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git /beagle/ComfyUI && \
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
pip install -r /beagle/ComfyUI/requirements.txt
```

### 安装插件 | ComfyUI-Manager

```bash
git clone https://github.com/ltdrdata/ComfyUI-Manager.git /beagle/ComfyUI/custom_nodes/ComfyUI-Manager && \
pip install -r /beagle/ComfyUI/custom_nodes/ComfyUI-Manager/requirements.txt
```

### 安装插件 | ComfyUI-Translation

```bash
git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION.git /beagle/ComfyUI/custom_nodes/AIGODLIKE_TRANSLATION
```

### 安装插件 | ComfyUI-Crystools

```bash
git clone https://github.com/crystian/ComfyUI-Crystools /beagle/ComfyUI/custom_nodes/ComfyUI-Crystools && \
pip install -r /beagle/ComfyUI/custom_nodes/ComfyUI-Crystools/requirements.txt
```

### 下载模型 | stable-diffusion-v1.5

```bash
baseURL="https://hf-mirror.com/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt?download=true" && \
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M ${baseURL} -d /beagle/ComfyUI/models/checkpoints -o v1-5-pruned-emaonly.ckpt
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
