#!/usr/bin/env bash
set -euo pipefail

# Arch dependencies
if command -v pacman >/dev/null 2>&1; then
  echo "Installing Arch packages (may require sudo)..."
  sudo pacman -S --needed --noconfirm base-devel cmake pipewire pipewire-audio pipewire-alsa pipewire-jack pipewire-pulse libpipewire alsa-lib wl-clipboard wtype rtkit curl git
fi

ROOT=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$ROOT/third_party"

# Fetch whisper.cpp as submodule if missing
if [ ! -d "$ROOT/third_party/whisper.cpp/.git" ]; then
  echo "Cloning whisper.cpp..."
  git clone --depth=1 https://github.com/ggerganov/whisper.cpp "$ROOT/third_party/whisper.cpp"
fi

# Fetch minimal WebRTC VAD sources
if [ ! -d "$ROOT/third_party/webrtcvad/webrtc" ]; then
  echo "Fetching WebRTC VAD minimal sources..."
  TMP=$(mktemp -d)
  git clone --depth=1 https://github.com/wiseman/py-webrtcvad "$TMP/py-webrtcvad"
  mkdir -p "$ROOT/third_party/webrtcvad/webrtc/common_audio/vad/include"
  mkdir -p "$ROOT/third_party/webrtcvad/webrtc/common_audio/vad"
  mkdir -p "$ROOT/third_party/webrtcvad/webrtc/common_audio/signal_processing"
  cp -r "$TMP/py-webrtcvad/cbits/webrtc/common_audio/vad" "$ROOT/third_party/webrtcvad/webrtc/common_audio/" 2>/dev/null || true
  cp -r "$TMP/py-webrtcvad/cbits/webrtc/common_audio/signal_processing" "$ROOT/third_party/webrtcvad/webrtc/common_audio/" 2>/dev/null || true
  rm -rf "$TMP"
fi

echo "Done. Build with:"
echo "  mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j$(nproc)"
